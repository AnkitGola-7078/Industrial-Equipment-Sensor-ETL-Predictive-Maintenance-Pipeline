# SQL Pipeline for NASA CMAPSS

This directory contains the SQL scripts that build the complete data ingestion, cleaning, and RUL computation pipeline for the CMAPSS engine datasets.

All processing is done inside MySQL, and the cleaned datasets are stored as SQL tables.

---

## 📁 SQL Contents

sql/
│
├── 01_create_raw_table.sql
├── 02_load_raw_data.sql
├── 03_clean_and_compute_rul.sql
│
├── 04_create_fd002_table.sql
├── 05_create_fd003_table.sql
├── 06_create_fd004_table.sql
│
└── cmaps_schema.sql

## What Each Script Does

### 01_create_raw_table.sql
Creates generic table structures for raw sensor data.

### 02_load_raw_data.sql
Loads NASA text files (FD001–FD004) into MySQL.

### 03_clean_and_compute_rul.sql
Cleans the data and computes RUL for each trajectory.

### 04–06_create_fd00x_table.sql
Creates dataset-specific cleaned tables:

- `clean_fd001`
- `clean_fd002`
- `clean_fd003`
- `clean_fd004`

Each includes:

- normalization  
- rolling features  
- RUL computation  

---

## Why Use SQL?

Using SQL for preprocessing ensures:

- Reproducibility  
- Fast querying and filtering  
- Avoids duplicating large intermediate CSVs  
- Clean separation between data engineering and model development

---

## How It Fits Into the Pipeline

1. Raw CMAPSS text files sit in `data/raw/`.
2. SQL scripts load them into MySQL (`raw_fd001`, …).
3. SQL transforms and cleans the data (`clean_fd001`, …).
4. Python notebooks connect to MySQL and pull the cleaned datasets.
5. ML models are trained on the cleaned data.

---

## 🔧 MySQL Requirements

- MySQL Server 8+
- `mysql-connector-python`
- SQLAlchemy (for Python integration)

Environment variables for DB connection are set in `.env` and loaded in Python.