with dm_customer as (
    select
    t.customer_id as dm_customer_id,
    t.store_id as dm_store_id,
    t.first_name,	
    t.last_name,
    t.email,
    t.address_id as dm_location_id,
    t.activebool,
    t.create_date,
    t.active
    from {{ ref("stg_Customer") }} as t
)
select *
from dm_customer