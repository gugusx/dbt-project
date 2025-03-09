{{ config(
    materialized='table',
    schema='raw'
) }}

select
    sales_id::int as sales_id,
    sales_date::timestamp as sales_date,
    sales_no::varchar(30) as sales_no,
    total_qty::numeric(10,4) as total_qty,
    total_amount::numeric(20,4) as total_amount,
    customer_id::int as customer_id,
    location_id::int as location_id
from {{ source('global', 'sales') }}
