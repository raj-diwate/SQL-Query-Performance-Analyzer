DELIMITER $$

-- Procedure to log query execution
CREATE PROCEDURE sp_log_query(
    IN p_query_id INT,
    IN p_user_id INT,
    IN p_database_id INT,
    IN p_execution_time_ms INT,
    IN p_rows_examined INT,
    IN p_rows_returned INT,
    IN p_execution_status VARCHAR(20)
)
BEGIN
    INSERT INTO query_logs (query_id, user_id, database_id, execution_time_ms, rows_examined, rows_returned, execution_status, executed_at)
    VALUES (p_query_id, p_user_id, p_database_id, p_execution_time_ms, p_rows_examined, p_rows_returned, p_execution_status, NOW());
END$$

-- Procedure to insert slow queries into slow_query_log
CREATE PROCEDURE sp_log_slow_queries()
BEGIN
    INSERT INTO slow_query_log (log_id, query_id, execution_time_ms, logged_at)
    SELECT log_id, query_id, execution_time_ms, NOW()
    FROM query_logs
    WHERE execution_time_ms > 1000; -- example threshold
END$$

DELIMITER ;
