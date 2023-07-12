with dm_category as (
    select
    t.category_id as dm_category_id,
    t.name
    from {{ ref("stg_Category") }} as t
)
select *
from dm_category