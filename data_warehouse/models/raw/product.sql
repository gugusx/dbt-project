{{ config(
    materialized='table',
    schema='raw'
) }}

select
    product_id::int as product_id,
    product_code::varchar(10) as product_code,
    product_name::varchar(100) as product_name,
    product_type_id::int as product_type_id,
    price::numeric(20,4) as price,
    last_purchase_price::numeric(20,4) as last_purchase_price
from {{ source('global', 'product') }}
