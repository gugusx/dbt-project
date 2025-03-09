{{ config(
    materialized='table',
    schema='raw'
) }}

select
    product_type_id::int as product_type_id,
    product_type_name::varchar(30) as product_type_name
from {{ source('global', 'product_type') }}
