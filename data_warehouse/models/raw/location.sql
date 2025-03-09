{{ config(
    materialized='table',
    schema='raw'
) }}

select
    location_id::int as location_id,
    location_code::varchar(10) as location_code,
    location_name::varchar(50) as location_name
from {{ source('global', 'location') }}
