-- View: Most frequently executed queries
CREATE OR REPLACE VIEW view_frequent_queries AS
SELECT query_text, execution_count
FROM frequent_queries
ORDER BY execution_count DESC;

-- View: Top slow queries
CREATE OR REPLACE VIEW view_slow_queries AS
SELECT query_text, avg_execution_time
FROM slow_queries
ORDER BY avg_execution_time DESC;

-- View: Inefficient queries
CREATE OR REPLACE VIEW view_inefficient_queries AS
SELECT query_text, rows_examined, rows_returned, inefficiency_ratio
FROM inefficient_queries
ORDER BY inefficiency_ratio DESC;

-- View: Query logs with user and database info
CREATE OR REPLACE VIEW view_query_logs AS
SELECT ql.log_id, q.query_text, u.username, db.database_name, ql.execution_time_ms, 
       ql.rows_examined, ql.rows_returned, ql.execution_status, ql.executed_at
FROM query_logs ql
JOIN queries q ON ql.query_id = q.query_id
LEFT JOIN users u ON ql.user_id = u.user_id
LEFT JOIN db_list db ON ql.database_id = db.database_id;
