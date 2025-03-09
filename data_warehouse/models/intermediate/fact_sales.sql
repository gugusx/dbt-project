{{ config(
    materialized='table',
    schema='intermediate'
) }}


SELECT
    sales_date,
    sales_no,
    product_id,
    qty,
    sub_total,
    location_id,
    customer_id
FROM {{ ref('sales') }} as s
INNER JOIN {{ ref('sales_detail') }} as sd
ON s.sales_id = sd.sales_id


-- Ref referes in models/raw/sales.sql
-- Ref referes in models/raw/sales_detail.sql
