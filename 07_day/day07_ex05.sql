SELECT person.name
FROM person
WHERE EXISTS(
    SELECT 1
    FROM person_order
    WHERE person.id = person_order.person_id
)
ORDER BY person.name;