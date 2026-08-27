# 📂 Data Directory

This folder contains the raw NASA CMAPSS datasets used for turbofan engine Remaining Useful Life (RUL) prediction.  
All raw files are provided by NASA and kept in their original format as text files.

---

## 📁 Folder Structure
data/
│
├── raw/
│ ├── train_FD001.txt
│ ├── test_FD001.txt
│ ├── RUL_FD001.txt
│ ├── train_FD002.txt
│ ├── test_FD002.txt
│ ├── RUL_FD002.txt
│ ├── train_FD003.txt
│ ├── test_FD003.txt
│ ├── RUL_FD003.txt
│ ├── train_FD004.txt
│ ├── test_FD004.txt
│ └── RUL_FD004.txt

## Description of Files

Each FD dataset contains:

### train_FDxxx.txt
Sensor readings for turbofan engines until failure.  
Used to learn degradation patterns.

### test_FDxxx.txt
Partial engine histories.  
Each engine in the test set fails after the last recorded cycle.

### RUL_FDxxx.txt
Remaining Useful Life at the end of each test engine trajectory.  
Used to compute true RUL during evaluation.

---

## Important Notes

- Raw data files are small enough to include in this repository.  
- Processed data files are not stored by default (they live in MySQL).
- You may export processed CSVs into `data/processed/` if needed for external deployment.

---

## 📚 Dataset Source

NASA CMAPSS Turbofan Engine Degradation Simulation Data Set  
https://ti.arc.nasa.gov/tech/dash/groups/pcoe/prognostic-data-repository/
