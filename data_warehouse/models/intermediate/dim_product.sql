{{ config(
    materialized='table',
    schema='intermediate'
) }}


SELECT
    product_id,
    product_code,
    product_name,
    product_type_name,
    price,
    last_purchase_price
FROM {{ ref('product') }} as p
INNER JOIN {{ ref('product_type') }} as pt
ON p.product_type_id = pt.product_type_id

-- Ref referes in models/raw/product.sql
-- Ref referes in models/raw/product_type.sql
