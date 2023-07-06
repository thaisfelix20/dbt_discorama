with source as (
    select
    t.store_id,   
    t.manager_staff_id,   
    t.address_id, 
    t.last_update
    from {{ source('lighthouse-391916', 'Store') }} as t
)
select *
from source