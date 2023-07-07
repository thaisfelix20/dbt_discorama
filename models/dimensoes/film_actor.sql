with film_actor as (
    select
    t.actor_id as dm_actor_id, 
    t.film_id as dm_film_id, 
    from {{ ref("stg_Film_actor") }} as t
)
select *
from film_actor