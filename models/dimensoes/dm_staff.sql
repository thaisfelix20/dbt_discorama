with dm_staff as (
    select
    t.staff_id as dm_staff_id, 
    t.first_name, 
    t.last_name, 
    t.address_id as dm_location_id, 
    t.email, 
    t.store_id as dm_store_id, 
    t.active, 
    t.username, 
    t.password
    from {{ ref("stg_Staff") }} as t
)
select *
from dm_staff