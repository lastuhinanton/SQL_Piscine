SELECT person.name AS person_name, menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name
FROM person_order
INNER JOIN menu
    ON person_order.menu_id = menu.id
INNER JOIN person
    ON person_order.person_id = person.id
INNER JOIN pizzeria
    ON menu.pizzeria_id = pizzeria.id
ORDER BY person_name ASC, pizza_name ASC, pizza_name ASC