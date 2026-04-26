SELECT
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
    destination_balance_change,

    -- Flags (important)
    CASE 
        WHEN old_balance_origin > 0 AND new_balance_origin = 0 
        THEN 1 ELSE 0 
    END AS origin_account_emptied_flag,

    CASE 
        WHEN old_balance_destination = 0 AND new_balance_destination = 0 
        THEN 1 ELSE 0 
    END AS destination_balance_unchanged_flag,

    CASE 
        WHEN amount > 100000 THEN 1 ELSE 0 
    END AS high_amount_flag,

    CASE 
        WHEN transaction_type IN ('TRANSFER', 'CASH_OUT') 
        THEN 1 ELSE 0 
    END AS risky_transaction_type_flag,

    -- Fraud Risk Score
    (
        CASE WHEN amount > 100000 THEN 30 ELSE 0 END
        +
        CASE WHEN old_balance_origin > 0 AND new_balance_origin = 0 THEN 25 ELSE 0 END
        +
        CASE WHEN old_balance_destination = 0 AND new_balance_destination = 0 THEN 20 ELSE 0 END
        +
        CASE WHEN transaction_type IN ('TRANSFER', 'CASH_OUT') THEN 15 ELSE 0 END
        +
        CASE WHEN is_flagged_fraud = 1 THEN 40 ELSE 0 END
    ) AS fraud_risk_score,

    -- Risk Category
    CASE
        WHEN is_fraud = 1 THEN 'CONFIRMED_FRAUD'

        WHEN (
            CASE WHEN amount > 100000 THEN 30 ELSE 0 END
            +
            CASE WHEN old_balance_origin > 0 AND new_balance_origin = 0 THEN 25 ELSE 0 END
            +
            CASE WHEN old_balance_destination = 0 AND new_balance_destination = 0 THEN 20 ELSE 0 END
            +
            CASE WHEN transaction_type IN ('TRANSFER', 'CASH_OUT') THEN 15 ELSE 0 END
            +
            CASE WHEN is_flagged_fraud = 1 THEN 40 ELSE 0 END
        ) >= 60 THEN 'HIGH_RISK'

        WHEN (
            CASE WHEN amount > 100000 THEN 30 ELSE 0 END
            +
            CASE WHEN old_balance_origin > 0 AND new_balance_origin = 0 THEN 25 ELSE 0 END
            +
            CASE WHEN old_balance_destination = 0 AND new_balance_destination = 0 THEN 20 ELSE 0 END
            +
            CASE WHEN transaction_type IN ('TRANSFER', 'CASH_OUT') THEN 15 ELSE 0 END
            +
            CASE WHEN is_flagged_fraud = 1 THEN 40 ELSE 0 END
        ) >= 30 THEN 'MEDIUM_RISK'

        ELSE 'LOW_RISK'
    END AS risk_category

FROM FRAUD_DETECTION_DB.MART.fact_transactions