-- snowflake_sql/02_create_raw_tables.sql

USE DATABASE FRAUD_DETECTION_DB;
USE WAREHOUSE FRAUD_WH;
USE SCHEMA RAW;

CREATE OR REPLACE TABLE RAW_TRANSACTIONS (
    step INT,
    type STRING,
    amount FLOAT,
    nameOrig STRING,
    oldbalanceOrg FLOAT,
    newbalanceOrig FLOAT,
    nameDest STRING,
    oldbalanceDest FLOAT,
    newbalanceDest FLOAT,
    isFraud INT,
    isFlaggedFraud INT
);

CREATE OR REPLACE TABLE RAW_CUSTOMERS (
    ID INT,
    Gender STRING,
    Ever_Married STRING,
    Age INT,
    Graduated STRING,
    Profession STRING,
    Work_Experience INT,
    Spending_Score STRING,
    Family_Size INT,
    Var_1 STRING,
    Segmentation STRING
);

CREATE OR REPLACE TABLE RAW_PRODUCTS (
    product_id STRING,
    product_category_name STRING,
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g FLOAT,
    product_length_cm FLOAT,
    product_height_cm FLOAT,
    product_width_cm FLOAT
);

CREATE OR REPLACE TABLE RAW_LOCATIONS (
    geolocation_zip_code_prefix INT,
    geolocation_lat FLOAT,
    geolocation_lng FLOAT,
    geolocation_city STRING,
    geolocation_state STRING
);