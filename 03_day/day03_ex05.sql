WITH info AS (
    SELECT pizzeria.name AS pizzeria_name, person_visits.visit_date AS date
    FROM person
    INNER JOIN person_visits
        ON person_visits.person_id = person.id
    INNER JOIN pizzeria
        ON pizzeria.id = person_visits.pizzeria_id
    WHERE person.name LIKE 'Andrey'

    EXCEPT

    SELECT pizzeria.name AS pizzeria_name, person_order.order_date AS date
    FROM person
    INNER JOIN person_order
        ON person_order.person_id = person.id
    INNER JOIN menu
        ON menu.id = person_order.menu_id
    INNER JOIN pizzeria
        ON pizzeria.id = menu.pizzeria_id
    WHERE person.name LIKE 'Andrey'
)
SELECT info.pizzeria_name
FROM info
ORDER BY pizzeria_name