-- db_list table
CREATE TABLE db_list (
    database_id INT AUTO_INCREMENT PRIMARY KEY,
    database_name VARCHAR(100)
);

-- users table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50)
);

-- queries table
CREATE TABLE queries (
    query_id INT AUTO_INCREMENT PRIMARY KEY,
    query_text TEXT
);

-- frequent_queries table
CREATE TABLE frequent_queries (
    query_text TEXT,
    execution_count BIGINT NOT NULL DEFAULT 0
);

-- inefficient_queries table
CREATE TABLE inefficient_queries (
    query_text TEXT,
    rows_examined INT,
    rows_returned INT,
    inefficiency_ratio DECIMAL(14,4)
);

-- slow_queries table
CREATE TABLE slow_queries (
    query_text TEXT,
    avg_execution_time DECIMAL(14,4)
);

-- query_logs table
CREATE TABLE query_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    query_id INT,
    user_id INT,
    database_id INT,
    execution_time_ms INT,
    rows_examined INT,
    rows_returned INT,
    execution_status VARCHAR(20),
    executed_at TIMESTAMP,
    FOREIGN KEY (query_id) REFERENCES queries(query_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (database_id) REFERENCES db_list(database_id)
);

-- slow_query_log table
CREATE TABLE slow_query_log (
    slow_log_id INT AUTO_INCREMENT PRIMARY KEY,
    log_id INT,
    query_id INT,
    execution_time_ms INT,
    logged_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
