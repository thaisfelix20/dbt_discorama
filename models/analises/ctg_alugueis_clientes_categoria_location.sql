with
pagamento as (
 select dm_rental_id,sum(amount) as Valor 
 from lighthouse-391916.dbt_tfelix_dimensoes.dm_payment
 group by dm_rental_id
),
juncao_tabela as (
SELECT rent.ft_rental_id,rent.rental_date,dmcus.first_name,dmcus.last_name, dmcus.email,dmcat.name, dmloc.country, dmpay.Valor
  
FROM lighthouse-391916.dbt_tfelix_dimensoes.ft_rental as rent
  LEFT JOIN lighthouse-391916.dbt_tfelix_dimensoes.dm_customer AS dmcus
  on rent.dm_customer_id = dmcus.dm_customer_id
  left join lighthouse-391916.dbt_tfelix_dimensoes.dm_inventory as dminv
  on dminv.dm_inventory_id = rent.dm_inventory_id
  left join lighthouse-391916.dbt_tfelix_dimensoes.dm_film as dmfilm
  on dmfilm.dm_film_id = dminv.dm_film_id
  left join lighthouse-391916.dbt_tfelix_dimensoes.film_category as filmcat
  on filmcat.dm_film_id = dmfilm.dm_film_id
  left join lighthouse-391916.dbt_tfelix_dimensoes.dm_category as dmcat
  on filmcat.dm_category_id = dmcat.dm_category_id
  left join lighthouse-391916.dbt_tfelix_dimensoes.dm_location as dmloc
  on dmloc.dm_location_id = dmcus.dm_location_id
  left join pagamento as dmpay
  on dmpay.dm_rental_id = rent.ft_rental_id
),
ctg_alugueis_clientes_categoria as (
 select rental_date as Dt_aluguel,ft_rental_id as ID,concat(first_name," ",last_name) as Cliente,email as Email,name as Categoria, country AS Pais, Valor
 from juncao_tabela
)
select *
from ctg_alugueis_clientes_categoria
