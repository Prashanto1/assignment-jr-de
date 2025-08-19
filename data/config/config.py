import pandas as pd
from sqlalchemy import create_engine
from datetime import datetime, timedelta
import pytz
import re

# Database connection details
destination_username = 'root'
destination_password = 'Prashant1234'
destination_host = '*.*.*.*'
destination_port = '3306'
destination_database_name = 'assignment_db'

# Connection string
destination_database_url = f'mysql+pymysql://{destination_username}:{destination_password}@{destination_host}:{destination_port}/{destination_database_name}'
destination_database_engine = create_engine(destination_database_url)
