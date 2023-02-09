WITH female_only AS (
    SELECT DISTINCT pizzeria.name AS pizzeria_name
    FROM person
    INNER JOIN person_order
        ON person_order.person_id = person.id
    INNER JOIN menu
        ON menu.id = person_order.menu_id
    INNER JOIN pizzeria
        ON pizzeria.id = menu.pizzeria_id
    WHERE person.gender LIKE 'female'

    EXCEPT

    SELECT DISTINCT pizzeria.name
    FROM person
    INNER JOIN person_order
        ON person_order.person_id = person.id
    INNER JOIN menu
        ON menu.id = person_order.menu_id
    INNER JOIN pizzeria
        ON pizzeria.id = menu.pizzeria_id
    WHERE person.gender LIKE 'male'
)
SELECT *
FROM female_only

UNION

SELECT *
FROM (
    SELECT DISTINCT pizzeria.name AS pizzeria_name
    FROM person
    INNER JOIN person_order
        ON person_order.person_id = person.id
    INNER JOIN menu
        ON menu.id = person_order.menu_id
    INNER JOIN pizzeria
        ON pizzeria.id = menu.pizzeria_id
    WHERE person.gender LIKE 'male'

    EXCEPT

    SELECT DISTINCT pizzeria.name
    FROM person
    INNER JOIN person_order
        ON person_order.person_id = person.id
    INNER JOIN menu
        ON menu.id = person_order.menu_id
    INNER JOIN pizzeria
        ON pizzeria.id = menu.pizzeria_id
    WHERE person.gender LIKE 'female'
) AS male_only
ORDER BY pizzeria_name