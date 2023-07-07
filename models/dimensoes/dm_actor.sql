with dm_actor as (
    select
    t.actor_id as dm_actor_id,
    t.first_name,
    t.last_name	
    from {{ ref("stg_Actor") }} as t
)
select *
from dm_actor