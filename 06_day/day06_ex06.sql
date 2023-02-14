DROP TABLE person_discounts;
DROP SEQUENCE IF EXISTS seq_person_discounts CASCADE;

CREATE TABLE IF NOT EXISTS person_discounts (
    id BIGINT PRIMARY KEY,
    person_id BIGINT,
    pizzeria_id BIGINT,
    discount_value NUMERIC(5, 2) CHECK ( discount_value BETWEEN 0 AND 100),
    CONSTRAINT fk_person_discounts_person_id
        FOREIGN KEY (person_id) REFERENCES person(id),
    CONSTRAINT fk_person_discounts_pizzeria_id
        FOREIGN KEY (pizzeria_id) REFERENCES pizzeria(id)
);

CREATE SEQUENCE seq_person_discounts
INCREMENT 1
START 1;

ALTER TABLE person_discounts
    ALTER COLUMN id
    SET DEFAULT NEXTVAL('seq_person_discounts');

INSERT INTO person_discounts (person_id, pizzeria_id, discount_value)
SELECT
        person_id,
        pizzeria_id,
        CASE
            WHEN count_orders = 1 THEN 10.5
            WHEN count_orders = 2 THEN 22
            ELSE 30
        END AS discount_value
FROM count_orders