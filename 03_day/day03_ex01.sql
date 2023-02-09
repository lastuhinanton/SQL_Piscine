SELECT menu.id AS menu_id
FROM menu
WHERE NOT EXISTS(
     SELECT 1
     FROM person_order
     WHERE menu.id = person_order.menu_id
)
ORDER BY menu_id
