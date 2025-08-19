import pandas as pd
import re

def normalize_df(df: pd.DataFrame):
    # Check if DataFrame is empty
    if df.empty:
        raise ValueError("Input DataFrame is empty")

    first_col = df.columns[0]
    print("First column:", first_col)

    # --- Clean currency values ---
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

    print("Generated column names from empty rows (with numbers):")
    print(column_list)

    # Only rename if we have something
    if column_list and len(column_list) == len(df_data.columns):
        df_data.columns = column_list

    # --- Detect section headers ---

    condition = df[first_col].notna() & df.drop(columns=first_col).isna().all(axis=1)
    # Get the indices where this condition is true
    start_indices = df.index[condition].tolist()
    print(start_indices)
    
    # --- Split into chunks ---
    chunks = {}
    for i in range(len(start_indices) - 1):
        name_value = df.loc[start_indices[i], first_col]
        chunk_df = df.iloc[start_indices[i]:start_indices[i+1]]
        chunks[f"{name_value}_df"] = chunk_df.reset_index(drop=True)

    # --- Debug print chunks ---
        
    for item, value in chunks.items():
        print(item)
        value_df = pd.DataFrame(value)
        if len(column_list) == len(value_df.columns):
            value_df.columns = column_list
        else:
            print(f"⚠️ Cannot rename: {len(value_df.columns)} columns in df but {len(column_list)} names provided")
        value_df.rename(columns={value_df.columns[0]: "Label"}, inplace=True)

        print(value_df)
        # break

    return chunks

# Example usage
if __name__ == "__main__":
    df = pd.read_csv("catx_table_0_clean.csv")
    print("Original shape:", df.shape)
    chunks = normalize_df(df)