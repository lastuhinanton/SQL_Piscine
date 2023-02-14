SELECT
        person.name AS name,
        menu.pizza_name AS pizza_name,
        menu.price AS price,
        menu.price * (1 - (person_discounts.discount_value / 100)) AS discount_price,
        pizzeria.name AS pizzeria_name
FROM person
INNER JOIN person_order
    ON person.id = person_order.person_id
INNER JOIN menu
        ON person_order.menu_id = menu.id
INNER JOIN pizzeria
        ON menu.pizzeria_id = pizzeria.id
INNER JOIN person_discounts
        ON person.id = person_discounts.person_id
WHERE
    pizzeria.id = person_discounts.pizzeria_id
ORDER BY person.name, menu.pizza_name;