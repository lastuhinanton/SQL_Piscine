INSERT INTO menu(id, pizzeria_id, pizza_name, price)
VALUES ((SELECT (MAX(id) + 1) FROM menu),
        (SELECT id FROM pizzeria WHERE pizzeria.name LIKE 'Dominos'),
        'sicilian pizza',
        900)