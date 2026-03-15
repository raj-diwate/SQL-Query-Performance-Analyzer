DELIMITER $$

-- Trigger to detect slow queries after insert
CREATE TRIGGER trg_after_insert_query_logs
AFTER INSERT ON query_logs
FOR EACH ROW
BEGIN
    IF NEW.execution_time_ms > 1000 THEN -- threshold for slow query
        INSERT INTO slow_query_log (log_id, query_id, execution_time_ms, logged_at)
        VALUES (NEW.log_id, NEW.query_id, NEW.execution_time_ms, NOW());
    END IF;
END$$

DELIMITER ;
