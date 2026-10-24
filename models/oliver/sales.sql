
  {{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}


SELECT
    c.first_name as cust_firstname,
    c.last_name as cust_lastname,
    d.date_id as date,
    s.store_name,
    p.product_name,
    e.first_name as emp_firstname,
    e.last_name as emp_lastname,
    ol.quantity,
    o.total_amount as dollars_sold,
    ol.unit_price
from {{ source('oliver_landing', 'orderline') }} ol
left join {{ source('oliver_landing', 'orders') }} o
    on ol.order_id = o.order_id
left join {{ ref("oliver_dim_customer") }} c
    on o.customer_id = c.customer_id
left join {{ ref("oliver_dim_store") }} s
    on o.store_id = s.store_id
left join {{ ref("oliver_dim_product") }} p
    on ol.product_id = p.product_id
left join {{ ref("oliver_dim_date") }} d 
    on o.order_date = d.date_key
left join {{ ref("oliver_dim_employee") }} e 
    on o.employee_id = e.employee_id
