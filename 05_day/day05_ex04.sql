SET enable_seqscan = OFF;

CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);

EXPLAIN ANALYSE
SELECT pizzeria_id, pizza_name
FROM menu
WHERE pizzeria_id = 5
    AND pizza_name = 'supreme pizza';