SELECT *
FROM person_discounts;

COMMENT ON TABLE person_discounts IS 'This is a table that includes information
of discounts in each pizzeria that were visited by people';

COMMENT ON COLUMN person_discounts.id IS 'ID number for each discount';

COMMENT ON COLUMN person_discounts.person_id IS 'Person ID number that has made an order
and had discount for it';

COMMENT ON COLUMN person_discounts.pizzeria_id IS 'ID number of each pizzeria where people has discounts';

COMMENT ON COLUMN person_discounts.discount_value IS 'Discount value for each discount';
