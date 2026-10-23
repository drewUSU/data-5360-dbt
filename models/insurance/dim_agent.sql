{{ config(
    materialized = 'table',
    schema = 'dw_insurance'
    )
}}

-- above is Jinja, which gives a sql file some python-like functionality

-- from here, we're going to make a model here that is a sql select statement. 
-- No CREATE TABLE, CREATE PROCEDURE, dbt takes our query and handles the rest!

select
    agentid as agent_key,
    agentid, 
    firstname, 
    lastname,
    email,
    phone
from  {{ source('insurance_landing', 'agents') }}-- not just a table name, now dbt knows the model here is 
-- dependent on this source (specified in our _src_insurance.yml as our specific 4 tables in our snowflake db)
