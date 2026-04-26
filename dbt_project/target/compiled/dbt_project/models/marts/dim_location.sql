SELECT DISTINCT
    zip_code,
    latitude,
    longitude,
    city,
    state
FROM FRAUD_DETECTION_DB.STAGING.stg_locations
WHERE zip_code IS NOT NULL