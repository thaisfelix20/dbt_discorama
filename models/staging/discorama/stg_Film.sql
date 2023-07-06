with source as (
    select
    t.film_id, 
    t.title, 
    t.description, 
    t.release_year, 
    t.language_id, 
    t.rental_duration, 
    t.rental_rate, 
    t.length, 
    t.replacement_cost, 
    t.rating, 
    t.last_update, 
    t.special_features, 
    t.fulltext
    from {{ source('lighthouse-391916', 'Film') }} as t
)
select *
from source