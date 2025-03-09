{{ config(
    materialized='table',
    schema='raw'
) }}

select
    sales_detail_id::int as sales_detail_id,
    sales_id::int as sales_id,
    product_id::int as product_id,
    qty::numeric(10,4) as qty,
    sub_total::numeric(20,4) as sub_total
from {{ source('global', 'sales_detail') }}
