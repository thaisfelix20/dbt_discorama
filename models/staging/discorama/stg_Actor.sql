with source as (
    select
    t.actor_id,
    t.first_name,
    t.last_name,	
    t.last_update	
    from {{ source('lighthouse-391916', 'Actor') }} as t
)
select *
from source