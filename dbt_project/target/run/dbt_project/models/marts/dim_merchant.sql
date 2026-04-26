
  
    

create or replace transient table FRAUD_DETECTION_DB.MART.dim_merchant
    
    
    
    as (SELECT DISTINCT
    merchant_id,
    zip_code,
    city,
    state
FROM FRAUD_DETECTION_DB.STAGING.stg_merchants
WHERE merchant_id IS NOT NULL
    )
;


  