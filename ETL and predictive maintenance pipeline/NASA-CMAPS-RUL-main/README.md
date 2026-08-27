## NASA CMAPS REMAINING USEFUL LIFE (RUL) ANALYSIS AND PREDICTIVE MODEL
A complete end-to-end pipeline using SQL, Python, feature engineering, machine learning, and model interpretability.


## Project Overview

This project builds a full Remaining Useful Life (RUL) prediction system using the NASA CMAPSS turbofan engine degradation datasets (FD001–FD004).
It implements the complete workflow from raw data ingestion → SQL storage → cleaning → feature engineering → model training → evaluation → interpretability.

The goal is to predict the number of cycles before an engine fails, enabling predictive maintenance and reducing asset downtime.

## Key Features
SQL-based data pipeline:
- All raw CMAPSS .txt files are automatically ingested into MySQL.
- SQL scripts create structured tables for each FD dataset.
- Cleaned, labeled RUL training sets are produced directly inside SQL.

Python processing:
- A unified loader builds datasets FD001–FD004 with consistent schema.
- RUL labels are computed per engine using cycle maxima.
- Advanced feature engineering (rolling stats, deltas, normalization).

Machine Learning models:
- Implemented models:
  - XGBoost Regressor
  - LightGBM Regressor (best performer)
  - Baseline models for comparison

Model interpretability:
- SHAP value analysis
- Feature importance plots
- Diagnostics for dataset drift and sensor relevance

Reproducible research structure:
- Includes:
  - Jupyter notebooks
  - SQL schema + load scripts
  - Clean environment (requirements.txt)
  - .env credential isolation
 

  ## REPOSITORY STRUCTURE
  NASA-CMAPS-RUL
  |
  |--data/
  |  |-- raw/CMAPS/
  |  |-- README.md
  |
  |-- notbooks/
  |   |-01_data_preparation.ipynb #loads data, computes RUL, exectures ML workflow
  |
  |-- sql/
  |   |-- 01_create_raw_table.sql
  |   |-- 02_load_raw_data.sql
  |   |-- 03_clean_and_compute_rul.sql
  |   |-- 04_create_raw_fd002_table.sql
  |   |-- 05_create_raw_fd003_table.sql
  |   |-- 06_create_raw_fd004_table.sql
  |   |-- cmaps_schema.sql
  |   |-- README.md
  |
  |--src/
  |
  |-- .gitignore
  |-- .env
  |-- requirements.txt
  |-- README.md


  ## DATABSE SCHEMA (SQL PIPELINE)
  Each FD dataset is stored in MySQL with the following schema:

  unit INT,
  cycle INT,
  op_setting_1 FLOAT,
  op_setting_2 FLOAT,
  op_setting_3 FLOAT,
  sensor_1  FLOAT,
  sensor_2  FLOAT,
  ...
  sensor_21 FLOAT,
  rul INT (after cleaning)

  SQL Pipeline Steps
  1. Create raw tables for each FD dataset
  2. Load raw .txt files using LOAD DATA INFIL
  3. Clean sensor values and normalise operating settings
  4. Compute max cycle per engine
  5. Compute RUL = max_cycle - cycle
  6. Store the cleaned dataset in clean_fd00X

  ## ML PIPELINE
1. Feature Engineering
     The following engineered features greatly improved model performance:
        - Rolling mean (window=5): sensor_i_roll5
        - Rolling standard deviation: sensor_i_std5
        - Cycle deltas: sensor_i_delta
        - Operational setting normalization
        - Cycle-based degradation curves
  After feature engineering, each FD dataset contained 40–50 features.
2. Model Training
     Ramping in compelxity from linear regression and random forest to training both LightGBM and XGBoost modes to lower the MAE and RMSE.
3. Model Interpretability (SHAP)
     SHAP is computed to understand which sensor contributes most, whether high or low sensor signas increase RUL and interaction with operational settings forming dependance plots and feature importance rankings.


   ## ENVIRONMENT SETUP
- Clone repository
        git clone https://github.com/AR011126/NASA-CMAPS-RUL.git
        cd NASA-CMAPS-RUL
- Create Environment
       pip install -r requirements.txt
- Set Up MYSQL Credentials in .env file
    MYSQL_HOST=localhost
    MYSQL_USER=root
    MYSQL_PASSWORD=your_password
    MYSQL_DATABASE=nasa_cmaps
- Run the notebook 
