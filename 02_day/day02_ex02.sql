SELECT CONCAT(
            CASE
                WHEN person.name IS NULL
                    THEN '-'
                    ELSE person.name
            END
       ) AS person_name,
       A.visit_date AS visit_date,
       CONCAT(
            CASE
                WHEN pizzeria.name IS NULL
                    THEN '-'
                    ELSE pizzeria.name
            END
       ) AS pizzeria_name
FROM person
LEFT JOIN (
    SELECT person_visits.person_id AS person_id, day::date AS visit_date, person_visits.pizzeria_id AS pizzeria_id
    FROM generate_series(
        timestamp
        '2022-01-01',
        '2022-01-03', INTERVAL '1 day') AS day
    LEFT JOIN person_visits
        ON person_visits.visit_date = day
) AS A
    ON person.id = A.person_id
FULL JOIN pizzeria
    ON pizzeria.id = A.pizzeria_id
ORDER BY person_name ASC, visit_date ASC, pizzeria_name ASC