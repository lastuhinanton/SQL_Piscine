SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name
FROM menu
INNER JOIN pizzeria
    ON pizzeria.id = menu.pizzeria_id;

EXPLAIN ANALYSE
SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name
FROM menu
INNER JOIN pizzeria
    ON pizzeria.id = menu.pizzeria_id;

-- The index is not being used by the query optimizer.
-- The size of the table is small enough that a full table scan is faster than using the index.