--READMISSIONS
LOAD DATA LOCAL INPATH '/usr/lib/hadoop/exercise1_data'
OVERWRITE INTO TABLE readmissions;
ALTER TABLE readmissions REPLACE COLUMNS(PROVIDER_ID VARCHAR(500), MEASURE_ID VARCHAR(500), COMPARED_TO_NATIONAL VARCHAR(500), DENOMENATOR VARCHAR(500), SCORE VARCHAR(500), LOWER_ESTIMATE varchar(500), HIGHER_ESTIMATE varchar(500), FOOTNOTE VARCHAR(500), MEASURE_START_DATE VARCHAR(500), MEASURE_END_DATE VARCHAR(500));