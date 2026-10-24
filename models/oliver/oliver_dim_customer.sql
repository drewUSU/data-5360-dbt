{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

select
    customer_id as customer_key,
    customer_id,
    state,
    email,
    first_name,
    last_name,
    phone_number
from {{ source('oliver_landing', 'customer')}}