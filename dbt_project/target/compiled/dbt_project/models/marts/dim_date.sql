SELECT DISTINCT
    step AS date_key,
    DATEADD(day, step - 1, TO_DATE('2024-01-01')) AS transaction_date,
    YEAR(DATEADD(day, step - 1, TO_DATE('2024-01-01'))) AS year,
    MONTH(DATEADD(day, step - 1, TO_DATE('2024-01-01'))) AS month,
    DAY(DATEADD(day, step - 1, TO_DATE('2024-01-01'))) AS day
FROM FRAUD_DETECTION_DB.STAGING.stg_transactions
WHERE step IS NOT NULL