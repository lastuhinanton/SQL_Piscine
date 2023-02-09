WITH A AS (
    SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name, menu.price AS price
    FROM pizzeria
    INNER JOIN menu
        ON menu.pizzeria_id = pizzeria.id
)
SELECT DISTINCT A.pizza_name, A.pizzeria_name, B.pizzeria_name, A.price
FROM A
INNER JOIN (
    SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name, menu.price AS price
    FROM pizzeria
    INNER JOIN menu
        ON menu.pizzeria_id = pizzeria.id) AS B
    ON A.pizza_name = B.pizza_name
WHERE
    A.price = B.price
    AND
    A.pizzeria_name < B.pizzeria_name
ORDER BY A.pizza_name