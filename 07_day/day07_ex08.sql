SELECT person.address, pizzeria.name, COUNT(*)
FROM person_order
INNER JOIN menu
    ON person_order.menu_id = menu.id
INNER JOIN pizzeria
    ON menu.pizzeria_id = pizzeria.id
INNER JOIN person
    ON person_order.person_id = person.id
GROUP BY person.address, pizzeria.name
ORDER BY person.address, pizzeria.name