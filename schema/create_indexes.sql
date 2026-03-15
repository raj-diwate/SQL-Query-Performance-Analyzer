CREATE INDEX idx_query_id
ON query_logs(query_id);

CREATE INDEX idx_user_id
ON query_logs(user_id);

CREATE INDEX idx_database_id
ON query_logs(database_id);

CREATE INDEX idx_execution_time
ON query_logs(execution_time_ms);
