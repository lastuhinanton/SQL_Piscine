WITH orders_and_visits AS (
    WITH visits_all AS (
        WITH visits AS (
            SELECT pizzeria_id, COUNT(*) AS count
            FROM person_visits
            INNER JOIN pizzeria
                ON person_visits.pizzeria_id = pizzeria.id
            GROUP BY pizzeria_id
        )
        SELECT pizzeria.name, visits.count AS count
        FROM visits
        INNER JOIN pizzeria ON visits.pizzeria_id = pizzeria.id
    )
    SELECT *
    FROM visits_all

    UNION ALL

    SELECT *
    FROM (
        SELECT pizzeria.name, orders.count AS count
        FROM (
            SELECT menu.pizzeria_id, COUNT(*) AS count
            FROM person_order
            INNER JOIN menu
                ON person_order.menu_id = menu.id
            GROUP BY pizzeria_id
        ) AS orders
        INNER JOIN pizzeria ON orders.pizzeria_id = pizzeria.id
    ) AS orders_all
)
SELECT pizzeria.name, SUM(COALESCE(orders_and_visits.count, 0)) as total_count
FROM orders_and_visits
RIGHT JOIN pizzeria ON pizzeria.name = orders_and_visits.name
GROUP BY pizzeria.name
ORDER BY total_count DESC, pizzeria.name ASC;