WITH mashroom_or_peporoni AS (
    SELECT menu.id AS menu_id
    FROM menu
    WHERE
         menu.pizza_name LIKE 'pepperoni pizza'
         OR
         menu.pizza_name LIKE 'mushroom pizza'
)
SELECT person.name AS name
FROM mashroom_or_peporoni
INNER JOIN person_order
    ON person_order.menu_id = mashroom_or_peporoni.menu_id
INNER JOIN person
    ON person.id = person_order.person_id
WHERE
    person.address = 'Moscow'
    OR
    person.address = 'Samara'
ORDER BY name DESC