WITH visits_all AS (
    WITH visits AS (
        SELECT pizzeria_id, COUNT(*) AS count, CONCAT('visit') AS action_type
        FROM person_visits
        INNER JOIN pizzeria
            ON person_visits.pizzeria_id = pizzeria.id
        GROUP BY pizzeria_id
    )
    SELECT pizzeria.name, visits.count AS count, visits.action_type
    FROM visits
    INNER JOIN pizzeria ON visits.pizzeria_id = pizzeria.id
    ORDER BY count DESC
    LIMIT 3
)
SELECT *
FROM visits_all

UNION ALL

SELECT *
FROM (
    SELECT pizzeria.name, orders.count AS count, orders.action_type
    FROM (
        SELECT menu.pizzeria_id, COUNT(*) AS count, CONCAT('order') AS action_type
        FROM person_order
        INNER JOIN menu
            ON person_order.menu_id = menu.id
        GROUP BY pizzeria_id
    ) AS orders
    INNER JOIN pizzeria ON orders.pizzeria_id = pizzeria.id
    ORDER BY count DESC
    LIMIT 3
) AS orders_all
ORDER BY action_type ASC, count DESC;