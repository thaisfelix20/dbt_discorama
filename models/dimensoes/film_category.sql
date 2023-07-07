with film_category as (
    select
    t.film_id as dm_film_id, 
    t.category_id as dm_category_id, 
    from {{ ref('stg_Film_category') }} as t
)
select *
from film_category