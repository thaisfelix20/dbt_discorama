with ft_rental as (
    select
    t.rental_id as ft_rental_id, 
    t.rental_date, 
    t.inventory_id dm_inventory_id, 
    t.customer_id as dm_customer_id, 
    t.return_date, 
    t.staff_id as dm_staff_id, 
    from {{ ref("stg_Rental") }} as t
)
select *
from ft_rental