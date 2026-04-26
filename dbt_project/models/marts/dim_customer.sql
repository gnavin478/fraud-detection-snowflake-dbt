SELECT DISTINCT
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
FROM {{ ref('stg_customers') }}
WHERE customer_id IS NOT NULL