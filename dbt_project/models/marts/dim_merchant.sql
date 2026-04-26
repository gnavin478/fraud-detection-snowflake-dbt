SELECT DISTINCT
    merchant_id,
    zip_code,
    city,
    state
FROM {{ ref('stg_merchants') }}
WHERE merchant_id IS NOT NULL