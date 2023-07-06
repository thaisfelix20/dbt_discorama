with source as (
    select
    t.film_id, 
    t.category_id, 
    t.last_update
    from {{ source('lighthouse-391916', 'Film_category') }} as t
)
select *
from source