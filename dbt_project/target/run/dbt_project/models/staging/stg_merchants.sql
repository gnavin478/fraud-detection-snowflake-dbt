
  create or replace   view FRAUD_DETECTION_DB.STAGING.stg_merchants
  
  
  
  
  as (
    SELECT
    TRIM(seller_id) AS merchant_id,

    seller_zip_code_prefix AS zip_code,

    LOWER(TRIM(seller_city)) AS city,

    UPPER(TRIM(seller_state)) AS state

FROM FRAUD_DETECTION_DB.RAW.RAW_MERCHANTS
WHERE seller_id IS NOT NULL
  );

