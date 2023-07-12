with
juncao_tabela as (
SELECT 
  dmloc.district,dmloc.country,dmloc.city,rent.ft_rental_id
FROM lighthouse-391916.dbt_tfelix_dimensoes.ft_rental as rent
  left join lighthouse-391916.dbt_tfelix_dimensoes.dm_customer as dmcust 
  on rent.dm_customer_id = dmcust.dm_customer_id
  left join lighthouse-391916.dbt_tfelix_dimensoes.dm_location as dmloc
  on dmloc.dm_location_id = dmcust.dm_location_id
) ,
ctg_alugados as (
  select country, district, city, count(*) as Quantidade_lugares
  from juncao_tabela
  group by country, district, city
  order by Quantidade_lugares desc
)
---ctg_estados_alugados as (
 --- select country,district, count(*) as Quantidade_Estados
---from juncao_tabela
 --- group by country,district
 --- order by Quantidade_Estados desc
---)
select *
from ctg_alugados


