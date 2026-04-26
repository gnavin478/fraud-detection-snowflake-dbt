SELECT
    -- basic fields
    step,
    
    -- standardize transaction type
    UPPER(TRIM(type)) AS transaction_type,
    
    -- clean amount
    CASE 
        WHEN amount < 0 THEN 0
        ELSE amount
    END AS amount,
    
    -- clean customer id
    TRIM(nameOrig) AS customer_id,
    
    -- clean destination id
    TRIM(nameDest) AS destination_id,
    
    -- handle null balances
    COALESCE(oldbalanceOrg, 0) AS old_balance_origin,
    COALESCE(newbalanceOrig, 0) AS new_balance_origin,
    COALESCE(oldbalanceDest, 0) AS old_balance_destination,
    COALESCE(newbalanceDest, 0) AS new_balance_destination,
    
    -- fraud flags
    COALESCE(isFraud, 0) AS is_fraud,
    COALESCE(isFlaggedFraud, 0) AS is_flagged_fraud,

    -- derived columns 🔥

    -- transaction category
    CASE 
        WHEN amount > 10000 THEN 'HIGH_VALUE'
        WHEN amount BETWEEN 1000 AND 10000 THEN 'MEDIUM_VALUE'
        ELSE 'LOW_VALUE'
    END AS transaction_category,

    -- balance change
    (COALESCE(newbalanceOrig,0) - COALESCE(oldbalanceOrg,0)) 
        AS origin_balance_change,
        
    (COALESCE(newbalanceDest,0) - COALESCE(oldbalanceDest,0)) 
        AS destination_balance_change

FROM FRAUD_DETECTION_DB.RAW.RAW_TRANSACTIONS

-- remove invalid records
WHERE amount IS NOT NULL