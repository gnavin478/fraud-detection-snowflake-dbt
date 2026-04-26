SELECT DISTINCT
    zip_code,
    latitude,
    longitude,
    city,
    state
FROM {{ ref('stg_locations') }}
WHERE zip_code IS NOT NULL