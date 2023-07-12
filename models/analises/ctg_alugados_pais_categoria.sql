with
juncao_tabela as (
SELECT rent.ft_rental_id,dmloc.country,dm_cat.name
  
FROM lighthouse-391916.dbt_tfelix_dimensoes.ft_rental as rent
  left join lighthouse-391916.dbt_tfelix_dimensoes.dm_customer as dmcust 
  on rent.dm_customer_id = dmcust.dm_customer_id
  left join lighthouse-391916.dbt_tfelix_dimensoes.dm_location as dmloc
  on dmloc.dm_location_id = dmcust.dm_location_id
  left join lighthouse-391916.dbt_tfelix_dimensoes.dm_inventory AS dminv
  ON rent.dm_inventory_id = dminv.dm_inventory_id
  LEFT JOIN lighthouse-391916.dbt_tfelix_dimensoes.dm_film AS dmfilm
  ON dminv.dm_film_id = dmfilm.dm_film_id
  LEFT JOIN lighthouse-391916.dbt_tfelix_dimensoes.film_category AS film_cat
  ON film_cat.dm_film_id = dmfilm.dm_film_id
  LEFT JOIN lighthouse-391916.dbt_tfelix_dimensoes.dm_category AS dm_cat
  ON dm_cat.dm_category_id = film_cat.dm_category_id

) ,
ctg_alugados_pais_categoria as (
 select ft_rental_id as ID, country, name AS Categoria, count(*) as Quantidade_pais_categoria
 from juncao_tabela
 group by ID, country, Categoria
 order by Quantidade_pais_categoria desc
)

select *
from ctg_alugados_pais_categoria


