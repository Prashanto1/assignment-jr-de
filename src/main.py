import os
import sys
import time

import pandas as pd
from sqlalchemy import text

from file_parser import parse_file
from data_cleaner import clean_data

from trasform_data import normalize_df

sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'data'))
import config.config as config

# Paths
DATA_DIR = os.path.join("..", "data", "filings")
# path = "/home/prash/assignment_jr_de/data/filings"
METADATA_FILE = os.path.join("..", "data", "company_metadata.csv")

def get_seen_files():
    """Fetch all filenames already processed"""
    with config.destination_database_engine.connect() as conn:
        result = conn.execute(text("SELECT filename FROM seen_files"))
        return {row[0] for row in result.fetchall()} 

def mark_files_seen(filenames):
    """Insert multiple new files into DB"""
    with config.destination_database_engine.connect() as conn:
        for fname in filenames:
            conn.execute(
                text("INSERT IGNORE INTO seen_files (filename) VALUES (:filename)"),
                {"filename": fname}
            )
        conn.commit()

def main():
    parsed_data = []

    all_files = {
        f for f in os.listdir(DATA_DIR)
        if f.lower().endswith((".html", ".pdf"))
    }

    seen_files = get_seen_files()
    new_files = all_files - seen_files  

    if new_files:
        print(f"New files detected: {new_files}")

        for filename in new_files:
            file_path = os.path.join(DATA_DIR, filename)
            try:
                tables = parse_file(file_path) 
                parsed_data.extend(tables)
            except Exception as e:
                print(f"Error parsing {filename}: {e}")

        mark_files_seen(new_files)


    #Step 2: Clean & standardize data
    print(" Cleaning and standardizing data...")
    # print(parsed_data)
    cleaned_data, file_names = clean_data(parsed_data, METADATA_FILE)

    ready_to_load = normalize_df(cleaned_data)
    print("load",len(ready_to_load))

    print("Loaded data into OLTP schema...")

    # Step 5: Run quality checks
    # print("✅ Running data quality checks...")
    # run_quality_checks()

    print("🎉 ETL pipeline completed successfully!")

if __name__ == "__main__":
    main()
    print(DATA_DIR)
   
