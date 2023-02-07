SELECT A.order_date AS action_date, A.name AS person_name
FROM  (
        SELECT  *
        FROM person_order, person
        WHERE person_order.person_id = person.id
) AS A

INTERSECT

SELECT B.visit_date AS action_date, B.name AS person_name
FROM  (
        SELECT  *
        FROM person_visits, person
        WHERE person_visits.person_id = person.id
) AS B
ORDER BY action_date ASC, person_name DESC
