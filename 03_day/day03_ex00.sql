WITH kate_id AS (
    SELECT person.id AS person_id, person.name AS name, person_visits.visit_date AS visit_date, person_visits.pizzeria_id AS pizzeria_id
    FROM person
    INNER JOIN person_visits
        ON person_visits.person_id = person.id
    WHERE person.name LIKE 'Kate'
)
SELECT menu.pizza_name AS pizza_name, menu.price AS price, pizzeria.name AS pizzeria_name, kate_id.visit_date AS visit_date
FROM kate_id
INNER JOIN menu
    ON menu.pizzeria_id = kate_id.pizzeria_id
INNER JOIN pizzeria
    ON pizzeria.id = kate_id.pizzeria_id
WHERE
    price BETWEEN 800 AND 1000
ORDER BY pizza_name ASC, price ASC, pizza_name ASC