WITH anna_and_denis_id AS (
    SELECT person.id AS id
    FROM person
    WHERE
         person.name LIKE 'Anna'
         OR
         person.name LIKE 'Denis'
)
SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name
FROM anna_and_denis_id
INNER JOIN person_order
    ON anna_and_denis_id.id = person_order.person_id
INNER JOIN menu
    ON person_order.menu_id = menu.id
INNER JOIN pizzeria
    ON pizzeria.id = menu.pizzeria_id
ORDER BY pizza_name, pizza_name