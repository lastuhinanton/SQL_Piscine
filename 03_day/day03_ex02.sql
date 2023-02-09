WITH forgotten_pizza AS (
    SELECT *
    FROM menu
    WHERE NOT EXISTS(
        SELECT 1
        FROM person_order
        WHERE menu.id = person_order.menu_id
    )
)
SELECT forgotten_pizza.pizza_name AS pizza_name, forgotten_pizza.price AS price, pizzeria.name AS pizzeria_name
FROM forgotten_pizza
INNER JOIN pizzeria
    ON pizzeria.id = forgotten_pizza.pizzeria_id
ORDER BY pizza_name ASC, price ASC