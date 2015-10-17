--EFFECTIVE CARE

LOAD DATA LOCAL INPATH '/usr/lib/hadoop/exercise1_data/effective_care.csv'
OVERWRITE INTO TABLE effective_care;
ALTER TABLE effective_care REPLACE COLUMNS(PROVIDER_ID VARCHAR(500), MEASURE_ID VARCHAR(500), CONDITION VARCHAR(500), MEASURE_NAME VARCHAR(500), SCORE VARCHAR(500), SAMPLE VARCHAR(500), FOOTNOTE VARCHAR(500), MEASURE_START_DATE VARCHAR(500), MEASURE_END_DATE VARCHAR(500));