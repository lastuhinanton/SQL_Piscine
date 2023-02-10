CREATE VIEW v_generated_dates AS
    SELECT day::date AS generated_date
    FROM generate_series('2022-01-01', '2022-01-31', INTERVAL '1 day') as day
    ORDER BY day