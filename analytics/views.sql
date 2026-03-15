CREATE VIEW slow_queries AS
SELECT
    q.query_text,
    AVG(l.execution_time_ms) AS avg_execution_time
FROM query_logs l
JOIN queries q ON l.query_id = q.query_id
GROUP BY q.query_text
ORDER BY avg_execution_time DESC;



CREATE VIEW frequent_queries AS
SELECT
    q.query_text,
    COUNT(*) AS execution_count
FROM query_logs l
JOIN queries q ON l.query_id = q.query_id
GROUP BY q.query_text
ORDER BY execution_count DESC;


CREATE VIEW inefficient_queries AS
SELECT
    q.query_text,
    l.rows_examined,
    l.rows_returned,
    (l.rows_examined / NULLIF(l.rows_returned,0)) AS inefficiency_ratio
FROM query_logs l
JOIN queries q ON l.query_id = q.query_id
ORDER BY inefficiency_ratio DESC;