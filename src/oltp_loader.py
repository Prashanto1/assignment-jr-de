import pandas as pd
import numpy as np
import re
import time
import hashlib

pd.set_option('display.max_columns',500)
from sqlalchemy import text

import pandas as pd
import re

import sys
import os
sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'data'))
import config.config as config
print(config.destination_database_name)



def shorten_column_name(col: str, max_len: int = 40) -> str:
    """
    Shorten column names to comply with MySQL's 64-character limit.
    Uses a hash suffix to avoid collisions.
    """
    import hashlib
    if len(col) <= max_len:
        return col
    # Take first 50 chars + hash
    hash_suffix = hashlib.md5(col.encode()).hexdigest()[:8]
    return col[:50] + "_" + hash_suffix

def shorten_identifier(name: str, max_len: int = 40) -> str:
    """
    Shorten MySQL identifiers (table/column names) to <=64 chars.
    Adds an md5 hash suffix to avoid collisions.
    """
    if len(name) <= max_len:
        return name
    hash_suffix = hashlib.md5(name.encode()).hexdigest()[:8]
    return name[:(max_len - 9)] + "_" + hash_suffix

def clean_and_format_df(df: pd.DataFrame) -> pd.DataFrame:
    df = df.copy()

    # Clean column names (except first col)
    df.columns = [
        df.columns[0] if i == 0 else 
        ''.join(c if c.isalnum() else '_' for c in col)
        for i, col in enumerate(df.columns)
    ]

    def format_val(x):
        if pd.isna(x) or str(x).strip() == "":
            return ""   # keep empty
        s = str(x).strip()

        # Remove existing $, commas, parentheses
        s = s.replace("$", "").replace(",", "").replace("(", "").replace(")", "")

        # Handle negatives
        is_negative = False
        if s.startswith("-"):
            is_negative = True
            s = s.lstrip("-")

        # If numeric → format with $
        if re.match(r"^\d+(\.\d+)?$", s):
            return f"-${s}" if is_negative else f"${s}"
        return s  # keep as is if not numeric

    # Apply cleaning for all cols except first
    for col in df.columns[1:]:
        df[col] = df[col].apply(format_val)

    return df

def df_to_mysql_sql(df: pd.DataFrame, table_name: str) -> str:
    dtype_mapping = {
        "int64": "INT",
        "float64": "DOUBLE",
        "object": "VARCHAR(255)",
        "datetime64[ns]": "DATETIME",
        "bool": "TINYINT(1)"
    }

    # 🔹 Shorten columns safely
    col_mapping = {col: shorten_identifier(col) for col in df.columns}
    df = df.rename(columns=col_mapping)

    drop_table_query = f"DROP TABLE IF EXISTS `{table_name}`;"

    columns_with_types = []
    for col, dtype in df.dtypes.items():
        sql_type = dtype_mapping.get(str(dtype), "VARCHAR(255)")
        columns_with_types.append(f"`{col}` {sql_type}")

    create_table_query = (
        f"CREATE TABLE `{table_name}` (\n  "
        + ",\n  ".join(columns_with_types)
        + "\n) ENGINE=InnoDB;"
    )

    insert_queries = []
    for _, row in df.iterrows():
        values = []
        for val in row:
            if pd.isna(val):
                values.append("NULL")
            elif isinstance(val, str):
                values.append("'" + val.replace("'", "''") + "'")
            elif isinstance(val, pd.Timestamp):
                values.append("'" + val.strftime("%Y-%m-%d %H:%M:%S") + "'")
            else:
                values.append(str(val))
        query = (
            f"INSERT INTO `{table_name}` "
            f"({', '.join([f'`{c}`' for c in df.columns])}) "
            f"VALUES ({', '.join(values)});"
        )
        insert_queries.append(query)

    return drop_table_query + "\n" + create_table_query + "\n\n" + "\n".join(insert_queries)

def transform_data(df):
    # Initialize output list to store transformed dataframes

    # --- Separate empty vs. non-empty rows ---
    mask_empty = df.apply(
        lambda row: any(
            (pd.isna(v)) or (str(v).strip() == "")
            for v in row
        ),
        axis=1
    )

    df_empty = df[mask_empty]
    df_data = df[~mask_empty].reset_index(drop=True)

    # --- Build column names dynamically ---
    column_list = []
    for col in df_empty.columns:
        values = [x for x in df_empty[col].dropna().astype(str).str.strip() if x]
        values_clean = ["_".join(w.split()) for w in values]
        joined = "_".join(values_clean)
        cleaned = re.sub(r"[^0-9a-zA-Z_]", "", joined) or f"{col}"
        column_list.append(cleaned)

    # print("Generated column names from empty rows (with numbers):")
    # print(column_list)

    # Only rename if we have something
    if column_list and len(column_list) == len(df_data.columns):
        df_data.columns = column_list


    # --- Reshape to wide format ---
    wide_df =pd.DataFrame()
    if column_list:
        key_col = column_list[0]  # use first generated column
        wide_df = df_data.set_index(key_col).T.reset_index()
    else:
        wide_df = df_data.copy()

    column_list2 = []
    for col in wide_df.columns:
        col_str = str(col).strip()
        col_str = "_".join(col_str.split())
        cleaned = re.sub(r"[^0-9a-zA-Z_]", "", col_str) or f"col_{len(column_list2)}"
        column_list2.append(cleaned)

    # print("column list2:", column_list2)
    if column_list2 and len(column_list2) == len(wide_df.columns):
        wide_df.columns = column_list2


    # --- Save to CSV with proper naming ---
    output_filename = f"transformed_df_{column_list[0]}.csv"
    # wide_df.to_csv(output_filename, index=False)
    df = clean_and_format_df(wide_df)
    df = df.dropna()
    shape = df.shape
    df = df.reset_index(drop=True)
    if shape[0] >1 and shape[1]>1:
        # Sanitize table name to avoid reserved keywords and invalid characters
        raw_table_name = shorten_identifier(column_list[0])
        # Replace reserved keywords and invalid characters
        table_name = f"financial_data_{raw_table_name.lower().replace(' ', '_').replace('-', '_')}"
        # Remove any non-alphanumeric characters except underscores
        table_name = re.sub(r'[^a-zA-Z0-9_]', '', table_name)
        # Ensure it doesn't start with a number
        if table_name and table_name[0].isdigit():
            table_name = f"t_{table_name}"
        
        sql_script = df_to_mysql_sql(df, table_name)
        print(table_name)
        statements = [stmt.strip() for stmt in sql_script.split(";") if stmt.strip()]

        with config.destination_database_engine.begin() as conn:
            for stmt in statements:
                conn.execute(text(stmt))



    return wide_df

