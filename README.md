# assignment_jr_de

End‑to‑end ETL pipeline that ingests investor filings (HTML/PDF), parses tabular data, cleans and standardizes it, and loads it into a MySQL OLTP schema as analysis‑ready tables. Includes example analytical SQL queries and an ERD.

---

## Contents
- Overview
- Architecture
- Requirements
- Setup
- Database preparation
- Configuration
- Running the pipeline
- Outputs
- Analytical queries
- ERD
- Troubleshooting
- Notes & roadmap

---

## Overview
This project watches a filings directory for new files, parses tables from HTML/PDF press releases/filings, normalizes the data into consistent wide tables, and writes those tables to MySQL. It also persists a `seen_files` registry so repeated runs only process newly added files.

Key features:
- HTML parsing via `pandas.read_html` + BeautifulSoup
- PDF parsing via `pdfplumber`
- Dynamic header detection and column name synthesis for messy tables
- Automatic table naming and safe MySQL identifier shortening
- Safe value formatting (currencies, negatives) before loading
- Idempotence through `seen_files` tracking

---

## Architecture
- `src/main.py`: Orchestrates the pipeline
  - Detects new files in `data/filings/`
  - Parses with `file_parser.parse_file`
  - Cleans with `data_cleaner.clean_data`
  - Normalizes and loads with `trasform_data.normalize_df` → `oltp_loader.transform_data`
- `src/file_parser.py`: Extracts tables from HTML/PDF into row‑dict lists
- `src/data_cleaner.py`: Detects headers/years, merges split currency parts, builds cleaned DataFrames
- `src/trasform_data.py`: Splits/normalizes tables, chunks by section, and delegates to the loader
- `src/oltp_loader.py`: Cleans identifiers, generates DDL/DML, and executes against MySQL
- `analytical_queries/queries.sql`: Example finance KPIs over produced OLTP tables
- `erd/assigment_schema_erd.png`: ERD for the OLTP tables
- `data/config/config.py`: MySQL connection config (SQLAlchemy engine)

Directory layout:
```
assignment_jr_de/
  ├─ src/
  │   ├─ main.py
  │   ├─ file_parser.py
  │   ├─ data_cleaner.py
  │   ├─ trasform_data.py
  │   ├─ oltp_loader.py
  │   ├─ olap_transformer.py  # placeholder
  │   └─ test*.py
  ├─ analytical_queries/
  │   └─ queries.sql
  ├─ erd/
  │   └─ assigment_schema_erd.png
  └─ data/
      ├─ filings/              # drop input HTML/PDF files here
      └─ config/
          └─ config.py         # DB connection
```

---

## Requirements
- Python 3.10+
- MySQL 8.x (or compatible) reachable from the machine running the ETL
- Python packages:
  - pandas, numpy
  - SQLAlchemy, PyMySQL
  - beautifulsoup4, lxml
  - pdfplumber

Example installation:
```bash
python -m venv .venv
source .venv/bin/activate
pip install pandas numpy sqlalchemy pymysql beautifulsoup4 lxml pdfplumber
```

---

## Setup
1) Clone this repository and create a virtual environment.
2) Install the required Python packages (see above).
3) Ensure a MySQL database exists and credentials are available.
4) Place your input filings into `data/filings/` (HTML or PDF).

---

## Database preparation
Create the destination database and a `seen_files` registry table:
```sql
CREATE DATABASE IF NOT EXISTS assignment_db;
USE assignment_db;

-- Tracks which source files were processed to ensure idempotency
CREATE TABLE IF NOT EXISTS seen_files (
  filename VARCHAR(255) PRIMARY KEY
);
```
The loader drops/creates OLTP tables on each run for each detected financial section. Ensure the DB user has privileges for `DROP TABLE`, `CREATE TABLE`, and `INSERT`.

---

## Configuration
Edit `data/config/config.py` to point to your MySQL instance:
```python
# data/config/config.py
destination_username = 'root'
destination_password = '********'
destination_host = '127.0.0.1'
destination_port = '3306'
destination_database_name = 'assignment_db'
```
Security tip: for production, prefer environment variables or a secrets manager. The current code reads this file directly.

---

## Running the pipeline
Run from the `src/` directory (paths are relative):
```bash
cd src
python main.py
```
What happens on each run:
- Lists all `*.html`/`*.pdf` in `../data/filings/`
- Computes `new_files = all_files - seen_files`
- Parses and cleans tables from new files only
- Normalizes and loads each logical section to a MySQL table named like `financial_data_<section>`
- Appends any CSV outputs of cleaned tables in `src/` (e.g., `ewcz_table_0_clean.csv`)

Sample log lines:
```
New files detected: {'EWCZ_20250813_PR.html', 'CATX_20250813_PR.html'}
 Cleaning and standardizing data...
🧹 Processing 10 tables
financial_data_current_assets
financial_data_operating_expenses
...
🎉 ETL pipeline completed successfully!
```

---

## Outputs
- MySQL tables in `assignment_db` named with prefix `financial_data_...`, e.g.:
  - `financial_data_current_assets`
  - `financial_data_current_liabilities`
  - `financial_data_revenue`
  - `financial_data_operating_expenses`
  - `financial_data_cash_flows_from_operating_activities`
  - etc.
- Optional CSVs of cleaned tables in `src/` named like `ewcz_table_<i>_clean.csv` or `catx_table_<i>_clean.csv` (useful for debugging)

Table naming & identifiers:
- Long identifiers are shortened with a hash suffix to satisfy MySQL limits
- Non‑alphanumeric characters are replaced with `_`
- If an identifier would start with a digit, it is prefixed with `t_`

Values formatting:
- Currency symbols/commas/parentheses are normalized
- Negatives are preserved

---

## Analytical queries
Open `analytical_queries/queries.sql` for example KPIs (working capital, debt‑to‑equity, margins, ROA, current ratio, turnover). Run them in MySQL Workbench, `mysql` CLI, or any BI tool connected to `assignment_db`.

---

## ERD
See `erd/assigment_schema_erd.png` for a visual of the OLTP schema produced by this pipeline.

---

## Troubleshooting
- No tables created / "Processing 0 tables": Ensure your filings in `data/filings/` contain extractable tables and are new (not already in `seen_files`). Delete a filename from `seen_files` to reprocess it.
- "Could not detect headers" warnings: The cleaner falls back to generic column names when headers are ambiguous. Data still loads; inspect the corresponding `*_clean.csv` for structure.
- PDF tables not detected: `pdfplumber` extraction quality varies by document. Consider pre‑converting to high‑quality tabular PDFs or using OCR when needed.
- DB connection errors: Verify `data/config/config.py` credentials and that MySQL is reachable. Confirm privileges for DDL and DML.
- Running from the wrong directory: Run `python main.py` from `src/` so relative paths resolve to `../data/...`.

---

## Notes & roadmap
- `src/olap_transformer.py` is a placeholder for a future OLAP‑oriented star schema transformation.
- The pipeline currently targets an OLTP‑style set of wide tables derived per section. A future iteration could materialize dimensions/facts.
- Consider moving secrets to environment variables and adding a `requirements.txt` for reproducible installs.
