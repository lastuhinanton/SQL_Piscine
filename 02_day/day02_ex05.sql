SELECT person.name AS name
FROM person
WHERE
    person.age > 25
    AND
    person.gender LIKE 'female'
ORDER BY person.name