-- FILE: 03_clean_and_compute_rul.sql
-- Purpose: Creates cleaned table and computes RUL for each record.

USE nasa_cmaps;

-- Start fresh
DROP TABLE IF EXISTS clean_fd001;

-- Temporary copy including placeholder column "rul"
CREATE TABLE clean_fd001 AS
SELECT 
    *,
    0 AS rul
FROM raw_fd001;

-- Compute RUL per unit
UPDATE clean_fd001 c
JOIN (
    SELECT unit, MAX(cycle) AS max_cycle
    FROM raw_fd001
    GROUP BY unit
) m ON c.unit = m.unit
SET c.rul = m.max_cycle - c.cycle;

-- Optional RUL cap (130)
ALTER TABLE clean_fd001 ADD COLUMN rul_capped INT;
UPDATE clean_fd001
SET rul_capped = LEAST(rul, 130);