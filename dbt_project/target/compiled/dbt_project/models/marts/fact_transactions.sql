SELECT
    step AS date_key,
    customer_id,
    destination_id,
    transaction_type,
    amount,
    old_balance_origin,
    new_balance_origin,
    old_balance_destination,
    new_balance_destination,
    is_fraud,
    is_flagged_fraud,
    transaction_category,
    origin_balance_change,
    destination_balance_change
FROM FRAUD_DETECTION_DB.STAGING.stg_transactions
WHERE customer_id IS NOT NULL