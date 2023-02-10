CREATE VIEW v_persons_female AS
    SELECT *
    FROM person
    WHERE gender LIKE 'female';

CREATE VIEW v_persons_male AS
    SELECT *
    FROM person
    WHERE gender LIKE 'male';