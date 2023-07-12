with
juncao_tabela as (
SELECT 
r.ft_rental_id,dmc.name
FROM `lighthouse-391916.dbt_tfelix_dimensoes.ft_rental` as r
left join lighthouse-391916.dbt_tfelix_dimensoes.dm_inventory as dmi 
on r.dm_inventory_id = dmi.dm_inventory_id
left join lighthouse-391916.dbt_tfelix_dimensoes.dm_film as dmf
on dmi.dm_film_id = dmf.dm_film_id
left join lighthouse-391916.dbt_tfelix_dimensoes.film_category as fc
on dmf.dm_film_id = fc.dm_film_id
left join lighthouse-391916.dbt_tfelix_dimensoes.dm_category as dmc
on fc.dm_category_id = dmc.dm_category_id
) ,
ctg_generos_alugados as (
  select name as Genero, count(*) as Quantidade_Genero
  from juncao_tabela
  group by name
  order by Quantidade_Genero desc
)
select *
from ctg_generos_alugados


