WITH possible_pizzerias AS (
    SELECT *
    FROM menu
    WHERE
        menu.pizza_name LIKE 'mushroom pizza'
        OR
        menu.pizza_name LIKE 'pepperoni pizza'
)
SELECT possible_pizzerias.pizza_name AS pizza_name,
       pizzeria.name AS pizzeria_name,
       possible_pizzerias.price AS price
FROM possible_pizzerias
INNER JOIN pizzeria
    ON pizzeria.id = possible_pizzerias.pizzeria_id
ORDER BY pizza_name ASC, pizzeria_name ASC