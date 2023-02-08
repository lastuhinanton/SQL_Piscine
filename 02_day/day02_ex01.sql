SELECT day_1::date AS missing_date
FROM generate_series(
    timestamp
    '2022-01-01',
    '2022-01-10', INTERVAL '1 day') AS day_1
LEFT JOIN (
    SELECT person_visits.visit_date AS day_2, person_visits.person_id AS person_id
    FROM person_visits
    WHERE person_visits.person_id BETWEEN 1 AND 2
) AS A
    ON A.day_2 = day_1
WHERE A.person_id IS NULL
