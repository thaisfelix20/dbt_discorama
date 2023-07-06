with source as (
    select
    t.country_id,
    t.country,
    t.last_update
    from {{ source('lighthouse-391916', 'Country') }} as t
)
select *
from source