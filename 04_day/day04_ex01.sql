SELECT name
FROM v_persons_male
UNION ALL
SELECT name
FROM v_persons_female
ORDER BY name