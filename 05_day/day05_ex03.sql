SELECT person_id, menu_id, order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 19;

SET enable_seqscan = OFF;

EXPLAIN ANALYSE
SELECT person_id, menu_id, order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 19;

CREATE INDEX person_order_multi ON person_order(person_id, menu_id, order_date);