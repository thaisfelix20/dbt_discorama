with dm_payment as (
    select
    t.payment_id as dm_payment_id, 
    t.customer_id as dm_customer_id, 
    t.staff_id as dm_staff_id, 
    t.rental_id as dm_rental_id, 
    t.amount, 
    t.payment_date
    from {{ ref("stg_Payment") }} as t
)
select *
from dm_payment