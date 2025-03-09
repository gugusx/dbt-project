{{ config(
    materialized='table',
    schema='intermediate'
) }}


SELECT
    location_id,
    location_code,
    location_name
FROM {{ ref('location') }}

-- Ref referes in models/raw/location.sql
