
  create or replace   view FRAUD_DETECTION_DB.STAGING.stg_customers
  
  
  
  
  as (
    SELECT
    ID AS customer_id,

    UPPER(TRIM(Gender)) AS gender,

    CASE 
        WHEN UPPER(TRIM(Ever_Married)) IN ('YES', 'NO') 
        THEN UPPER(TRIM(Ever_Married))
        ELSE 'UNKNOWN'
    END AS ever_married,

    CASE 
        WHEN Age < 0 OR Age > 120 THEN NULL
        ELSE Age
    END AS age,

    CASE 
        WHEN UPPER(TRIM(Graduated)) IN ('YES', 'NO') 
        THEN UPPER(TRIM(Graduated))
        ELSE 'UNKNOWN'
    END AS graduated,

    COALESCE(NULLIF(TRIM(Profession), ''), 'UNKNOWN') AS profession,

    COALESCE(Work_Experience, 0) AS work_experience,

    UPPER(TRIM(Spending_Score)) AS spending_score,

    COALESCE(Family_Size, 0) AS family_size,

    COALESCE(NULLIF(TRIM(Var_1), ''), 'UNKNOWN') AS var_1,

    UPPER(TRIM(Segmentation)) AS segmentation

FROM FRAUD_DETECTION_DB.RAW.RAW_CUSTOMERS
WHERE ID IS NOT NULL
  );

