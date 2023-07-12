with dm_inventory as (
    select
    t.inventory_id as dm_inventory_id, 
    t.film_id as dm_film_id, 
    t.store_id as dm_store_id, 
    from {{ ref("stg_Inventory") }} as t
)
select *
from dm_inventory