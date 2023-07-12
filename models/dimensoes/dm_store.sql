with dm_store as (
    select
    t.store_id as dm_store_id,   
    t.manager_staff_id as manager_dm_staff_id,   
    t.address_id as dm_location_id, 
    from {{ ref("stg_Store") }} as t
)
select *
from dm_store