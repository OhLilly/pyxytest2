--CREATE TEMP TABLE seq_0_to_100 AS (
    SELECT 0 AS i UNION ALL
    SELECT 1 UNION ALL
    SELECT 2 UNION ALL
    SELECT 3 UNION ALL
    SELECT 4 UNION ALL
    SELECT 5
    -- I am stopping here, you could easily generate this as a VIEW with 100+ real rows...