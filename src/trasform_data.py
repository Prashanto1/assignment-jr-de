import os
import sys
import time
import re
import hashlib
import pandas as pd
import numpy as np
from sqlalchemy import text

sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'data'))
import config.config as config
import oltp_loader as oltp_loader

pd.set_option('display.max_columns', 500)

print(config.destination_database_name)
def normalize_df(list_dfs):
    transformed_dfs = []
    for i, df in enumerate(list_dfs):
        # Check if DataFrame is empty
        if df.empty:
            raise ValueError("Input DataFrame is empty")

        first_col = df.columns[0]
        print("First column:", first_col)

        def clean_currency(value):
            if isinstance(value, str):
                value = value.replace('$', '').replace(',', '').replace('(', '-').replace(')', '')
                try:
                    return float(value)
                except ValueError:
                    return value
            return value


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

        if column_list and len(column_list) == len(df_data.columns):
            df_data.columns = column_list


        condition = df[first_col].notna() & df.drop(columns=first_col).isna().all(axis=1)
        start_indices = df.index[condition].tolist()
        
        chunks = {}
        for i in range(len(start_indices) - 1):
            name_value = df.loc[start_indices[i], first_col]
            chunk_df = df.iloc[start_indices[i]:start_indices[i+1]]
            chunks[f"{name_value}_df"] = chunk_df.reset_index(drop=True)

        # --- Debug print chunks ---
            
        for item, value in chunks.items():
            value_df = pd.DataFrame(value)
            if len(column_list) == len(value_df.columns):
                value_df.columns = column_list
            else:
                print(f"⚠️ Cannot rename: {len(value_df.columns)} columns in df but {len(column_list)} names provided")
            value_df.rename(columns={value_df.columns[0]: "Label"}, inplace=True)

           
            df = oltp_loader.transform_data(value_df)
            transformed_dfs.append(df)

    return transformed_dfs   

        



