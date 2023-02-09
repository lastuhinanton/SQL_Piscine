INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT (MAX(id) + 1) FROM person_visits),
        (SELECT id FROM person WHERE name LIKE 'Denis'),
        (SELECT id FROM pizzeria WHERE name LIKE 'Dominos'),
        '2022-02-24');

INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT (MAX(id) + 1) FROM person_visits),
        (SELECT id FROM person WHERE name LIKE 'Irina'),
        (SELECT id FROM pizzeria WHERE name LIKE 'Dominos'),
        '2022-02-24')