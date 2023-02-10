CREATE VIEW v_symmetric_union AS
    SELECT *
    FROM (
            SELECT person_visits.person_id
            FROM person_visits
            WHERE visit_date = '2022-01-02'
            EXCEPT ALL
            SELECT person_visits.person_id
            FROM person_visits
            WHERE visit_date = '2022-01-06'
     ) AS R

    UNION ALL

    SELECT *
    FROM (
            SELECT person_visits.person_id
            FROM person_visits
            WHERE visit_date = '2022-01-06'
            EXCEPT ALL
            SELECT person_visits.person_id
            FROM person_visits
            WHERE visit_date = '2022-01-02'
     ) AS S
    ORDER BY person_id