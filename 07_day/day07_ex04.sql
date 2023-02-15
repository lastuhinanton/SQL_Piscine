SELECT person.name AS name, COUNT(*) AS counts_of_visits
FROM person_visits
INNER JOIN person ON person.id = person_visits.person_id
GROUP BY name
HAVING COUNT(*) > 3;