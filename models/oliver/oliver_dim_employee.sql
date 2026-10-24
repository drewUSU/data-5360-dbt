{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

select
    employee_id as employee_key,
    employee_id,
    position,
    hire_date,
    email,
    first_name,
    last_name,
    phone_number
from {{ source('oliver_landing', 'employee')}}