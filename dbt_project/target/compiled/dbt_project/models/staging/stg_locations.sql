SELECT
    geolocation_zip_code_prefix AS zip_code,
    geolocation_lat AS latitude,
    geolocation_lng AS longitude,
    LOWER(TRIM(geolocation_city)) AS city,
    UPPER(TRIM(geolocation_state)) AS state
FROM FRAUD_DETECTION_DB.RAW.RAW_LOCATIONS
WHERE geolocation_zip_code_prefix IS NOT NULL