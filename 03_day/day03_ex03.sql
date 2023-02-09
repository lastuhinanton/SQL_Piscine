WITH female_only AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM person
    INNER JOIN person_visits
        ON person_visits.person_id = person.id
    INNER JOIN pizzeria
        ON pizzeria.id = person_visits.pizzeria_id
    WHERE person.gender LIKE 'female'

    EXCEPT ALL

    SELECT pizzeria.name AS pizzeria_name
    FROM person
    INNER JOIN person_visits
        ON person_visits.person_id = person.id
    INNER JOIN pizzeria
        ON pizzeria.id = person_visits.pizzeria_id
    WHERE person.gender LIKE 'male'
)
SELECT *
FROM female_only

UNION ALL

SELECT *
FROM (
    SELECT pizzeria.name AS pizzeria_name
    FROM person
    INNER JOIN person_visits
        ON person_visits.person_id = person.id
    INNER JOIN pizzeria
        ON pizzeria.id = person_visits.pizzeria_id
    WHERE person.gender LIKE 'male'

    EXCEPT ALL

    SELECT pizzeria.name AS pizzeria_name
    FROM person
    INNER JOIN person_visits
        ON person_visits.person_id = person.id
    INNER JOIN pizzeria
        ON pizzeria.id = person_visits.pizzeria_id
    WHERE person.gender LIKE 'female'
) AS male_only
ORDER BY pizzeria_name;