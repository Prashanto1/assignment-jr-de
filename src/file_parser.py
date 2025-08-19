import os
import pandas as pd
from bs4 import BeautifulSoup
import pdfplumber
from io import StringIO

def parse_file(file_path):
    """
    Detect file type and extract tables from HTML or PDF filings.
    Returns a list of parsed tables in dict format.
    """
    ext = os.path.splitext(file_path)[1].lower()
    results = []

    if ext == ".html":
        results.extend(_parse_html(file_path))
    elif ext == ".pdf":
        pass
        results.extend(_parse_pdf(file_path))
    else:
        print(f"[file_parser] Unsupported file type: {ext}")

    return results

def _parse_html(file_path):
    # print(f"[file_parser] Parsing HTML: {file_path}")
    results = []
    try:
        with open(file_path, "r", encoding="utf-8", errors="ignore") as f:
            soup = BeautifulSoup(f, "lxml")

        # Pandas read_html directly from string
        tables = pd.read_html(StringIO(str(soup)))
        for i, table in enumerate(tables):
            results.append({
                "source_file": os.path.basename(file_path),
                "table_index": i,
                "data": table.to_dict(orient="records")
            })
       
    except Exception as e:
        print(f"[file_parser] Error parsing HTML {file_path}: {e}")

    return results

def _parse_pdf(file_path):
    """Extract tables from a PDF filing using pdfplumber."""
    print(f"[file_parser] Parsing PDF: {file_path}")
    results = []

    try:
        with pdfplumber.open(file_path) as pdf:
            for page_num, page in enumerate(pdf.pages, start=1):
                tables = page.extract_tables()
                for i, table in enumerate(tables):
                    # Convert list-of-lists to DataFrame
                    df = pd.DataFrame(table)
                    results.append({
                        "source_file": os.path.basename(file_path),
                        "page": page_num,
                        "table_index": i,
                        "data": df.to_dict(orient="records")
                    })

    except Exception as e:
        print(f"[file_parser] Error parsing PDF {file_path}: {e}")

    return results
