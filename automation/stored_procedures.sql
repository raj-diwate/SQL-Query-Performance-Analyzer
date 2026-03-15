DELIMITER $$

CREATE PROCEDURE query_performance_report()
BEGIN

SELECT * FROM slow_queries LIMIT 10;

SELECT * FROM frequent_queries LIMIT 10;

SELECT * FROM inefficient_queries LIMIT 10;

END$$

DELIMITER ;