with source as (
    select
    t.actor_id, 
    t.film_id, 
    t.last_update
    from {{ source('lighthouse-391916', 'Film_actor') }} as t
)
select *
from source