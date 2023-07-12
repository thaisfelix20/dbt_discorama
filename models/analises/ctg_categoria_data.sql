WITH
  juncao_tabela AS (
  SELECT
    dm_cat.name,rent.rental_date,rent.ft_rental_id
  FROM
    lighthouse-391916.dbt_tfelix_dimensoes.ft_rental AS rent
  LEFT JOIN
    lighthouse-391916.dbt_tfelix_dimensoes.dm_inventory AS dminv
  ON
    rent.dm_inventory_id = dminv.dm_inventory_id
  LEFT JOIN
    lighthouse-391916.dbt_tfelix_dimensoes.dm_film AS dmfilm
  ON
    dminv.dm_film_id = dmfilm.dm_film_id
  LEFT JOIN
    lighthouse-391916.dbt_tfelix_dimensoes.film_category AS film_cat
  ON
    film_cat.dm_film_id = dmfilm.dm_film_id
  LEFT JOIN
    lighthouse-391916.dbt_tfelix_dimensoes.dm_category AS dm_cat
  ON
    dm_cat.dm_category_id = film_cat.dm_category_id ),
  ctg_categoria_data AS (
  SELECT
    ft_rental_id AS ID,rental_date AS DT, EXTRACT(YEAR FROM rental_date) AS YEAR,EXTRACT(MONTH FROM rental_date) AS MONTH,EXTRACT(DAY FROM rental_date) AS DAY,name AS CATEGORY, COUNT(*) AS QTD
  FROM juncao_tabela
  GROUP BY ID,DT,YEAR,MONTH,DAY,CATEGORY
  ORDER BY QTD DESC 
)
SELECT
  *
FROM
  ctg_categoria_data