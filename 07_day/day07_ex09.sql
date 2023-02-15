SELECT address,
       ROUND(MAX(age) - (MIN(age)::DECIMAL / MAX(age)), 2) AS formula,
       ROUND(AVG(age), 2) AS average,
       CASE
            WHEN (MAX(age) - (MIN(age) / MAX(age))) > AVG(age)
                THEN 'true'
                ELSE 'false'
       END
FROM person
GROUP BY address
ORDER BY address;