CREATE VIEW count_orders AS
    SELECT
           person_order.person_id AS person_id,
           menu.pizzeria_id AS pizzeria_id,
           COUNT(*) AS count_orders
    FROM person_order
    INNER JOIN menu ON person_order.menu_id = menu.id
    GROUP BY person_order.person_id, menu.pizzeria_id
    ORDER BY 1 ASC;

INSERT INTO person_discounts (id, person_id, pizzeria_id, discount_value)
SELECT
        ROW_NUMBER() OVER () AS id,
        person_id,
        pizzeria_id,
        CASE
            WHEN count_orders = 1 THEN 10.5
            WHEN count_orders = 2 THEN 22
            ELSE 30
        END AS discount_value
FROM count_orders