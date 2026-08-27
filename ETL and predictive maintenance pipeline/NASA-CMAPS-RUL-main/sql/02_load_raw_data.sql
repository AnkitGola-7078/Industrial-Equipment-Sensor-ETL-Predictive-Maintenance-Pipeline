-- FILE: 02_load_raw_data.sql
-- Purpose: Loads NASA CMAPS FD001 training data into raw_fd001.

USE nasa_cmaps;

LOAD DATA LOCAL INFILE 'C:/Users/Ale/Documents/Projects/NASA DATASET/data/raw/CMaps/train_FD001.txt'
INTO TABLE raw_fd001
FIELDS TERMINATED BY ' '
LINES TERMINATED BY '\n'
IGNORE 0 LINES;