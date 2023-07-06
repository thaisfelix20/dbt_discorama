with source as (
    select
    t.inventory_id, 
    t.film_id, 
    t.store_id, 
    t.last_update
    from {{ source('lighthouse-391916', 'Inventory') }} as t
)
select *
from source