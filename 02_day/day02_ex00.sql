SELECT pizzeria.name AS name, pizzeria.rating AS rating
FROM pizzeria
LEFT JOIN person_visits
    ON pizzeria.id = person_visits.pizzeria_id
WHERE person_visits.id IS NULL