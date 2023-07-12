with source as (
    select
    t.staff_id, 
    t.first_name, 
    t.last_name, 
    t.address_id, 
    t.email, 
    t.store_id, 
    t.active, 
    t.username, 
    t.password, 
    t.last_update, 
    t.picture
    from {{ source('lighthouse-391916', 'Staff') }} as t
), n_null as(
    select *
    from source
    where staff_id is not null 
    and SAFE_CAST(staff_id AS INT64) IS NOT NULL
)
select *
from n_null