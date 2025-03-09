{{ config(
    materialized='table',
    schema='dwh'
) }}


SELECT
    product_name,
    product_type_name,
    extract(month from sales_date) as month,
    extract(year from sales_date) as year,
    customer_name,
    location_name,
    sum(qty) as total_qty,
    sum(sub_total) as sub_total
FROM {{ ref('fact_sales') }} as s
LEFT JOIN {{ ref('dim_customer') }} as c 
ON s.customer_id =  c.customer_id
LEFT JOIN {{ ref('dim_product') }} as p
ON s.product_id = p.product_id
LEFT JOIN {{ ref('dim_location') }} as l
ON s.location_id = l.location_id
GROUP BY 1,2,3,4,5,6
