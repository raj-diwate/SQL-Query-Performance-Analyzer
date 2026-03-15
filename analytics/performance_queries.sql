-- Top frequently executed queries
SELECT query_text, execution_count
FROM frequent_queries
ORDER BY execution_count DESC;

-- Inefficient queries based on rows examined vs rows returned
SELECT query_text, rows_examined, rows_returned, inefficiency_ratio
FROM inefficient_queries
ORDER BY inefficiency_ratio DESC;

-- Queries with highest average execution time
SELECT query_text, avg_execution_time
FROM slow_queries
ORDER BY avg_execution_time DESC;

-- Query logs for all executions
SELECT ql.log_id, q.query_text, u.username, db.database_name, ql.execution_time_ms, 
       ql.rows_examined, ql.rows_returned, ql.execution_status, ql.executed_at
FROM query_logs ql
JOIN queries q ON ql.query_id = q.query_id
LEFT JOIN users u ON ql.user_id = u.user_id
LEFT JOIN db_list db ON ql.database_id = db.database_id
ORDER BY ql.executed_at DESC;
