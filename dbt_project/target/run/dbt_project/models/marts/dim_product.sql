
  
    

create or replace transient table FRAUD_DETECTION_DB.MART.dim_product
    
    
    
    as (SELECT DISTINCT
    product_id,
    category_name,
    product_name_length,
    product_description_length,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM FRAUD_DETECTION_DB.STAGING.stg_products
WHERE product_id IS NOT NULL
    )
;


  