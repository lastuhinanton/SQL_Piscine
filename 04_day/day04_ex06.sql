CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
    WITH info_id AS (
        SELECT person_visits.pizzeria_id AS pizzeria_id
        FROM person
        INNER JOIN person_visits
            ON person.id = person_visits.person_id
        WHERE
             person.name LIKE 'Dmitriy'
             AND
             person_visits.visit_date = '2022-01-08'
    )
    SELECT pizzeria.name AS pizzeria_name, menu.pizza_name AS pizza_name
    FROM info_id
    INNER JOIN pizzeria
        ON info_id.pizzeria_id = pizzeria.id
    INNER JOIN menu
        ON pizzeria.id = menu.pizzeria_id
    WHERE
        menu.price < 800
WITH DATA;


REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

SELECT *
FROM mv_dmitriy_visits_and_eats