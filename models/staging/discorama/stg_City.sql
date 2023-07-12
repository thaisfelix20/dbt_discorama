with source as (
    select
    t.city_id,
    t.city,
    t.country_id,
    t.last_update		
    from {{ source('lighthouse-391916', 'City') }} as t
)
select *
from source