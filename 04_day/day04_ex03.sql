SELECT DISTINCT generated_date
FROM v_generated_dates
LEFT JOIN person_visits
    ON generated_date = person_visits.visit_date
WHERE id IS NULL
ORDER BY generated_date