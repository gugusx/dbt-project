{{ config(
    materialized='table',
    schema='intermediate'
) }}


SELECT
    customer_id,
    customer_code,
    customer_name,
    email,
    handphone,
    address,
    create_date
FROM {{ ref('customer') }}

-- Ref referes in models/raw/customer.sql
