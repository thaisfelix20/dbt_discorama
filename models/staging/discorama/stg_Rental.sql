with source as (
    select
    t.rental_id, 
    t.rental_date, 
    t.inventory_id, 
    t.customer_id, 
    t.return_date, 
    t.staff_id, 
    t.last_update
    from {{ source('lighthouse-391916', 'Rental') }} as t
)
select *
from source