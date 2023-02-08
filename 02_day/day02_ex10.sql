SELECT A.name AS person_name1, B.name AS person_name2, A.address AS common_address
FROM person AS A
INNER JOIN person AS B
    ON A.address = B.address
WHERE
    A.name < B.name
ORDER BY person_name1 ASC, person_name2 ASC, common_address ASC