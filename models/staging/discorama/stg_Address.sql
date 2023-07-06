with source as (
    select
        t.address_id,	
        t.address,
        t.address2,
        t.district,
        t.city_id,
        t.postal_code,
        t.phone,
        t.last_update	
    from {{ source('lighthouse-391916', 'Address') }} as t
)
select *
from source
