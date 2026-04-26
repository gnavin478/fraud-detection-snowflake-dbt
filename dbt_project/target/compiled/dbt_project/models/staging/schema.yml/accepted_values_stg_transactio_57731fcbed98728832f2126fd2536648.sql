
    
    

with all_values as (

    select
        transaction_type as value_field,
        count(*) as n_records

    from FRAUD_DETECTION_DB.STAGING.stg_transactions
    group by transaction_type

)

select *
from all_values
where value_field not in (
    'PAYMENT','TRANSFER','CASH_OUT','CASH_IN','DEBIT'
)


