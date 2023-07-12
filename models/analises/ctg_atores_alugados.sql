with
juncao_tabela as (
SELECT 
r.ft_rental_id,dmac.first_name,dmac.last_name
FROM `lighthouse-391916.dbt_tfelix_dimensoes.ft_rental` as r
left join lighthouse-391916.dbt_tfelix_dimensoes.dm_inventory as dmi 
on r.dm_inventory_id = dmi.dm_inventory_id
left join lighthouse-391916.dbt_tfelix_dimensoes.dm_film as dmf
on dmi.dm_film_id = dmf.dm_film_id
left join lighthouse-391916.dbt_tfelix_dimensoes.film_actor as fa
on dmf.dm_film_id = fa.dm_film_id
left join lighthouse-391916.dbt_tfelix_dimensoes.dm_actor as dmac
on fa.dm_actor_id = dmac.dm_actor_id
) ,
ctg_atores_alugados as (
  select concat(first_name," ",last_name) as Atores, count(*) as Quantidade_Atuacoes
  from juncao_tabela
  where first_name is not null or last_name is not null 
  group by Atores
  order by Quantidade_Atuacoes desc
)
select *
from ctg_atores_alugados


