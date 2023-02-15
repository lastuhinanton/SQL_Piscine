SELECT person.id AS person_id, visits.count_visits AS count_of_visits
FROM person
INNER JOIN (
    SELECT person_id, COUNT(*) AS count_visits
    FROM person_visits
    GROUP BY person_id
) AS visits
    ON person.id = visits.person_id
ORDER BY count_of_visits DESC, person_id ASC