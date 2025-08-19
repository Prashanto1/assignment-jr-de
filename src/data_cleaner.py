import pandas as pd
import numpy as np
import re

pd.set_option('display.max_columns',500)


def merge_split_values(row, value_col, symbol_col=None, paren_col=None, suffix_col=None):
    """Helper function to merge split values (e.g., '$', '5393', ')', '%') into a single value."""
    # Safely get values, defaulting to empty string if column is missing or value is NaN
    symbol = row.get(symbol_col, '') if symbol_col in row.index and pd.notnull(row[symbol_col]) else ''
    value = row.get(value_col, '') if value_col in row.index and pd.notnull(row[value_col]) else ''
    paren = row.get(paren_col, '') if paren_col is not None and paren_col in row.index and pd.notnull(row[paren_col]) else ''
    suffix = row.get(suffix_col, '') if suffix_col is not None and suffix_col in row.index and pd.notnull(row[suffix_col]) else ''
    
    # Convert all to strings to ensure consistency
    symbol = str(symbol)
    value = str(value)
    paren = str(paren)
    suffix = str(suffix)
    
    # Handle cases where no symbol is provided but value is numeric (assume $)
    if symbol != '$' and value and value.replace('(', '').replace(')', '').replace('-', '').replace(',', '').replace('.', '').replace('—', '').isdigit():
        symbol = '$'
    
    # Merge values based on context
    if symbol == '$' and value.startswith('('):
        return f'{symbol}{value}{paren}'.strip()
    elif symbol == '$' or value == '—':
        return f'{symbol}{value}'.strip()
    elif suffix in ['%', 'x']:
        return f'{value}{suffix}'.strip()
    return value if value and value != 'nan' else None


def create_dynamic_dataframe(table_data, table_index, source_file):
    """Create raw and cleaned DataFrames for a given table."""
    # Create initial DataFrame
    df = pd.DataFrame(table_data['data'])
    

    
    # Ensure all columns are strings, replacing NaN with empty string
    for col in df.columns:
        df[col] = df[col].fillna('').astype(str)
    
    # Debug: Print column types and first few rows
    # print(f"\nTable {table_index} ({source_file}): {len(df)} rows, {len(df.columns)} columns")
    # print("Column types:", df.dtypes)
    # print("First few rows:\n", df.head())
    
    # Determine table type based on column count
    num_cols = len(df.columns)
    
    # Find header and year rows
    header_row = None
    year_row = None
    for idx, row in df.iterrows():
        # Combine all columns for pattern matching
        row_content = ' '.join(row.astype(str).values).lower()
        
        # Debug: Print row being evaluated
        # print(f"Evaluating row {idx} for headers: {row_content[:50]}...")
        
        # Check for header patterns (expanded for CATX)
        if any(pattern in row_content for pattern in [
            'fiscal 2025 outlook', 'for the thirteen weeks ended', 'for the twenty-six weeks ended',
            'trailing twelve months', 'three months ended', 'six months ended', 'june 30', 'december 31', '(unaudited)'
        ]):
            header_row = idx
        # Check for year patterns
        if any(year in row_content for year in ['2025', '2024']):
            year_row = idx
        if header_row is not None and year_row is not None:
            break
    
    # Set column names
    if header_row is not None and year_row is not None:
        headers = df.iloc[header_row].dropna().astype(str).values[1:]  # Skip column 0 (labels)
        years = df.iloc[year_row].dropna().astype(str).values[1:]      # Skip column 0
        # Adjust column names based on source file
        if 'CATX' in source_file:
            column_names = [f"{h} {y}" if 'Ended' in h or 'June 30,' in h or 'December 31,' in h else y for h, y in zip(headers, years)]
        else:
            column_names = [f"{h} {y}" if 'Fiscal' in h or 'Ended' in h else y for h, y in zip(headers, years)]
    else:
        column_names = [f"Column_{i}" for i in range(1, num_cols)]
        print(f"Warning: Could not detect headers for table {table_index} in {source_file}. Using default column names.")

    # Define column mappings for merging split values
    if num_cols == 3:  # Outlook tables (EWCZ table_index 0, 1)
        value_cols = [1, 2]
        symbol_cols = [None, None]
        paren_cols = [None, None]
        suffix_cols = [None, None]
    elif num_cols == 6:  # Net leverage table (EWCZ table_index 7)
        value_cols = [3]
        symbol_cols = [2]
        paren_cols = [4]
        suffix_cols = [5]
    elif num_cols == 9:  # Balance sheet, cash flow (EWCZ table_index 2, 4; CATX table_index 0)
        value_cols = [3, 7]
        symbol_cols = [2, 6]
        paren_cols = [4, 8]
        suffix_cols = [None, None]
    elif num_cols in [17, 21]:  # Operations, adjusted metrics, EBITDA (EWCZ table_index 3, 5, 6; CATX table_index 1)
        value_cols = [3, 7, 11, 15]
        symbol_cols = [2, 6, 10, 14]
        paren_cols = [4, 8, 12, 16]
        suffix_cols = [4, 8, 12, 16] if num_cols == 21 else [None, None, None, None]
        if num_cols == 21:  # EWCZ table 6 has an extra column
            value_cols.append(19)
            symbol_cols.append(18)
            paren_cols.append(20)
            suffix_cols.append(20)
    else:
        print(f"Error: Unhandled column count {num_cols} for table {table_index} in {source_file}")
        return df, pd.DataFrame()

    # Create cleaned DataFrame
    cleaned_data = []
    for _, row in df.iterrows():
        label = row[0] if pd.notnull(row[0]) else row.get(2, '')
        # Include relevant headers and data rows
        if pd.notnull(label) or row.get(2, '') in ['July 5, 2025', 'July 6, 2024', 'June 30, 2025', 'June 30, 2024', 'December 31, 2024', '(in thousands)', '(unaudited)']:
            row_data = {'Label': label}
            for col_name, value_col, symbol_col, paren_col, suffix_col in zip(column_names, value_cols, symbol_cols, paren_cols, suffix_cols):
                row_data[col_name] = merge_split_values(row, value_col, symbol_col, paren_col, suffix_col)
            cleaned_data.append(row_data)

    df_clean = pd.DataFrame(cleaned_data)
    df_raw = df

    # Drop fully NaN columns in cleaned DataFrame
    df_clean = df_clean.dropna(how='all', axis=1)
    
    # Debug: Print final column names and cleaned DataFrame head
    # print(f"Final column names: {df_clean.columns.tolist()}")
    # print(f"Cleaned DataFrame head:\n{df_clean.head()}")
    
    return df_raw, df_clean
def clean_data(parsed_data, metadata_path=None):
    """Process a list of tables and generate raw and cleaned DataFrames."""
    print(f"🧹 Processing {len(parsed_data)} tables")
    processed_dfs = []
    file_names = []
    
    for table in parsed_data:
        table_index = table.get('table_index', 'unknown')
        source_file = table.get('source_file', 'unknown')
        json_data = table.get('data', {})
        if not json_data:
            print(f"Error: No data found for table {table_index} in {source_file}")
            continue
        
        # print(f"Table {table_index} ({source_file}): {len(json_data)} rows, {len(json_data[0]) if json_data else 0} columns")
        
        try:
            df_raw, df_clean = create_dynamic_dataframe(table, table_index, source_file)
            # print(f"Table {table_index} Cleaned DataFrame shape: {df_clean.shape}")
            
            # Save to CSV (uncomment to enable)
            output_prefix = 'ewcz' if 'EWCZ' in source_file else 'catx'
            # df_raw.to_csv(f'{output_prefix}_table_{table_index}_raw.csv', index=False)
            df_clean.to_csv(f'{output_prefix}_table_{table_index}_clean.csv', index=False)
            
            # Display DataFrames
            # print(f"\nTable {table_index} ({source_file}) shape: {df_clean.shape} Cleaned DataFrame:")
            
            # print(df_clean) 
          
          
            processed_dfs.append(df_clean)
            file_names.append(source_file)
            
        except Exception as e:
            print(f"Error processing table {table_index} in {source_file}: {str(e)}")

    
    return processed_dfs, file_names