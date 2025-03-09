{{ config(
    materialized='table',
    schema='raw'
) }}

select
    customer_id::int as customer_id,
    customer_code::varchar(10) as customer_code,
    customer_name::varchar(100) as customer_name,
    email::varchar(50) as email,
    handphone::varchar(20) as handphone,
    address::text as address,
    create_date::timestamp as create_date
from {{ source('global', 'customer') }}
