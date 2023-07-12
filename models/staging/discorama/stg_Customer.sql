with source as (
    select
    t.customer_id,
    t.store_id,
    t.first_name,	
    t.last_name,
    t.email,
    t.address_id,
    t.activebool,
    t.create_date,
    t.last_update,	
    t.active
    from {{ source('lighthouse-391916', 'Customer') }} as t
)
select *
from source