-- FILE: 01_create_raw_table.sql
-- Purpose: Creates the raw table for NASA CMAPS FD001 dataset.

DROP TABLE IF EXISTS raw_fd001;

CREATE TABLE raw_fd001 (
    unit INT,
    cycle INT,
    op_setting_1 FLOAT,
    op_setting_2 FLOAT,
    op_setting_3 FLOAT,
    sensor_1 FLOAT,
    sensor_2 FLOAT,
    sensor_3 FLOAT,
    sensor_4 FLOAT,
    sensor_5 FLOAT,
    sensor_6 FLOAT,
    sensor_7 FLOAT,
    sensor_8 FLOAT,
    sensor_9 FLOAT,
    sensor_10 FLOAT,
    sensor_11 FLOAT,
    sensor_12 FLOAT,
    sensor_13 FLOAT,
    sensor_14 FLOAT,
    sensor_15 FLOAT,
    sensor_16 FLOAT,
    sensor_17 FLOAT,
    sensor_18 FLOAT,
    sensor_19 FLOAT,
    sensor_20 FLOAT,
    sensor_21 FLOAT
);