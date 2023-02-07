SELECT id AS object_id, name AS object_name
FROM person
UNION
SELECT id AS object_id, pizza_name AS object_name
FROM menu
ORDER BY object_id ASC, object_name ASC