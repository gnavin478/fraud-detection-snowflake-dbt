
  
    

create or replace transient table FRAUD_DETECTION_DB.MART.dim_location
    
    
    
    as (SELECT DISTINCT
    zip_code,
    latitude,
    longitude,
    city,
    state
FROM FRAUD_DETECTION_DB.STAGING.stg_locations
WHERE zip_code IS NOT NULL
    )
;


  