with source as (
    select
    t.payment_id, 
    t.customer_id, 
    t.staff_id, 
    t.rental_id, 
    t.amount, 
    t.payment_date
    from {{ source('lighthouse-391916', 'Payment') }} as t
)
select *
from source