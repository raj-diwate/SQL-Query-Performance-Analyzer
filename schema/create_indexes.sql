-- Index on query_logs for faster filtering
CREATE INDEX idx_query_logs_query_id ON query_logs(query_id);
CREATE INDEX idx_query_logs_user_id ON query_logs(user_id);
CREATE INDEX idx_query_logs_database_id ON query_logs(database_id);
CREATE INDEX idx_query_logs_execution_time ON query_logs(execution_time_ms);

-- Index on frequent_queries
CREATE INDEX idx_frequent_queries_execution_count ON frequent_queries(execution_count);

-- Index on inefficient_queries
CREATE INDEX idx_inefficient_queries_ratio ON inefficient_queries(inefficiency_ratio);

-- Index on slow_queries
CREATE INDEX idx_slow_queries_avg_time ON slow_queries(avg_execution_time);
