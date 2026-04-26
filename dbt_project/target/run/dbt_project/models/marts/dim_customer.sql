
  
    

create or replace transient table FRAUD_DETECTION_DB.MART.dim_customer
    
    
    
    as (SELECT DISTINCT
    customer_id,
    gender,
    ever_married,
    age,
    graduated,
    profession,
    work_experience,
    spending_score,
    family_size,
    segmentation
FROM FRAUD_DETECTION_DB.STAGING.stg_customers
WHERE customer_id IS NOT NULL
    )
;


  