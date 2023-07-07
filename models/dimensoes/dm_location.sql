with 
stg_address as (
    select
        t.address_id,	
        t.address,
        t.address2,
        t.district,
        t.city_id,
        t.postal_code,
        t.phone,
        t.last_update	
from {{ ref("stg_Address") }} as t
),
stg_city as (
    select
        t.city_id,
        t.city,
        t.country_id,
        t.last_update		
    from {{ ref("stg_City") }} as t
) ,
stg_country as (
    select
        t.country_id,
        t.country,
        t.last_update
    from {{ ref('stg_Country') }} as t
),
dm_location as (
select 
    stg_address.address_id as dm_location_id, 
    stg_address.address,
    stg_address.address2,
    stg_address.district,
    stg_address.postal_code,
    stg_address.phone,
    stg_country.country,
    stg_city.city
from stg_address 
left join stg_city on stg_address.city_id = stg_city.city_id
left join stg_country on stg_country.country_id = stg_city.country_id

)
select *
from dm_location
