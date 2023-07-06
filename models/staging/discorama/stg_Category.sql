with source as (
    select
    t.category_id,
    t.name,
    t.last_update,
    from {{ source('lighthouse-391916', 'Category') }} as t
)
select *
from source