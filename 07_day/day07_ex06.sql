SELECT pizzeria.name, COUNT(*) AS count_of_orders,
       ROUND(AVG(price), 2) AS average_price, MAX(price) AS max_price, MIN(price) AS min_price
FROM person_order
INNER JOIN menu
    ON person_order.menu_id = menu.id
INNER JOIN pizzeria
    ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY pizzeria.name;