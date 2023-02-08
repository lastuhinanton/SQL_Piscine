SELECT cheese_pizza_lovers.name AS name
FROM (
     WITH femail_id AS (
        SELECT person.id AS id, person.name AS name FROM person WHERE person.gender LIKE 'female'
     )
     SELECT femail_id.id, femail_id.name, menu.pizza_name
     FROM femail_id
     INNER JOIN person_order
         ON person_order.person_id = femail_id.id
     INNER JOIN menu
         ON menu.id = person_order.menu_id
     WHERE
         pizza_name LIKE 'cheese pizza'
) AS cheese_pizza_lovers
LEFT JOIN  (
     WITH femail_id AS (
         SELECT person.id AS id, person.name AS name FROM person WHERE person.gender LIKE 'female'
     )
     SELECT femail_id.id, femail_id.name, menu.pizza_name FROM femail_id
     INNER JOIN person_order
         ON person_order.person_id = femail_id.id
     INNER JOIN menu
         ON menu.id = person_order.menu_id
     WHERE
         pizza_name LIKE 'pepperoni pizza'
) AS peeperoni_pizza_lovers
     ON peeperoni_pizza_lovers.name = cheese_pizza_lovers.name
WHERE
    peeperoni_pizza_lovers.id IS NOT NULL
ORDER BY name
