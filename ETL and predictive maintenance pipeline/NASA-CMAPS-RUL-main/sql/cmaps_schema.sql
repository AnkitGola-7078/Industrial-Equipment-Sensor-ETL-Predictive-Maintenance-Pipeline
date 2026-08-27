CREATE DATABASE IF NOT EXISTS nasa_cmaps;
USE nasa_cmaps;

DROP TABLE IF EXISTS raw_fd001;

CREATE TABLE raw_fd001 (
    engine_id INT,
    cycle INT,
    op_setting_1 DOUBLE,
    op_setting_2 DOUBLE,
    op_setting_3 DOUBLE,
    sensor_1 DOUBLE,
    sensor_2 DOUBLE,
    sensor_3 DOUBLE,
    sensor_4 DOUBLE,
    sensor_5 DOUBLE,
    sensor_6 DOUBLE,
    sensor_7 DOUBLE,
    sensor_8 DOUBLE,
    sensor_9 DOUBLE,
    sensor_10 DOUBLE,
    sensor_11 DOUBLE,
    sensor_12 DOUBLE,
    sensor_13 DOUBLE,
    sensor_14 DOUBLE,
    sensor_15 DOUBLE,
    sensor_16 DOUBLE,
    sensor_17 DOUBLE,
    sensor_18 DOUBLE,
    sensor_19 DOUBLE,
    sensor_20 DOUBLE,
    sensor_21 DOUBLE
);