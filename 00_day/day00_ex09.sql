SELECT *
FROM (
     SELECT person.name, pizzeria.name
     FROM
          person,
          person_visits,
          pizzeria
     WHERE
         person.id = person_visits.person_id
         AND
         pizzeria.id = person_visits.pizzeria_id
         AND
         person_visits.visit_date BETWEEN '2022-01-07' AND '2022-01-09'
     ORDER BY
         person.name ASC,
         pizzeria.name DESC
) AS A

