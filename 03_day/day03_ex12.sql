INSERT INTO person_order(id, person_id, menu_id, order_date)
WITH start_gen AS (
    (SELECT MAX(id) + 1 AS max FROM person_order)
),
 end_gen AS (
     WITH one_max AS ((SELECT MAX(id) AS max FROM person_order)),
          two_max AS ((SELECT COUNT(*) AS max FROM person))
     SELECT (one_max.max + two_max.max) as max
     FROM one_max,
          two_max
 )
SELECT generate_series((SELECT start_gen.max FROM start_gen), (SELECT end_gen.max FROM end_gen), 1) AS gen,
       generate_series((SELECT MIN(id) FROM person), (SELECT COUNT(*) FROM person)) AS person_id,
       (SELECT id FROM menu WHERE menu.pizza_name = 'greek pizza') AS menu_id,
       '2022-02-25' AS order_date