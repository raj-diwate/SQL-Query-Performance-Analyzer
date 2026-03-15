1️⃣ Trigger to Log Every Query Execution
Logs every new query inserted into the queries table.
  
 DELIMITER //

CREATE TRIGGER log_query_insert
AFTER INSERT ON queries
FOR EACH ROW
BEGIN
    INSERT INTO query_logs(query_id, executed_at, execution_status)
    VALUES (NEW.query_id, NOW(), 'logged');
END //

DELIMITER ;

Purpose: Automatically logs queries into query_logs.

2️⃣ Trigger to Detect Slow Queries
If execution time is greater than 1000 ms, it stores it in slow_queries.

DELIMITER //

CREATE TRIGGER detect_slow_query
AFTER INSERT ON query_logs
FOR EACH ROW
BEGIN
    IF NEW.execution_time_ms > 1000 THEN
        INSERT INTO slow_queries(query_id, execution_time_ms)
        VALUES (NEW.query_id, NEW.execution_time_ms);
    END IF;
END //

DELIMITER ;
Purpose: Automatically tracks slow queries.

3️⃣ Trigger to Detect Inefficient Queries
If too many rows are examined compared to rows returned.

DELIMITER //

CREATE TRIGGER detect_inefficient_query
AFTER INSERT ON query_logs
FOR EACH ROW
BEGIN
    IF NEW.rows_examined > 1000 THEN
        INSERT INTO inefficient_queries(query_id, rows_examined)
        VALUES (NEW.query_id, NEW.rows_examined);
    END IF;
END //

DELIMITER ;

Purpose: Detects inefficient queries scanning too many rows.
