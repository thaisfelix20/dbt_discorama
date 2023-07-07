with dm_film as (
    select
    t.film_id as dm_film_id, 
    t.title, 
    t.description, 
    t.release_year, 
    t.language_id, 
    t.rental_duration, 
    t.rental_rate, 
    t.length, 
    t.replacement_cost, 
    t.rating, 
    t.special_features, 
    t.fulltext
    from {{ ref("stg_Film") }} as t
)
select *
from dm_film