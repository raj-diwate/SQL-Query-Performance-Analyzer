INSERT INTO users (username) VALUES
('alice'),
('bob'),
('charlie');

INSERT INTO db_list (database_name) VALUES
('ecommerce'),
('analytics'),
('inventory');



INSERT INTO query_logs
(query_id,user_id,database_id,execution_time_ms,rows_examined,rows_returned,execution_status,executed_at)
VALUES
(1,1,1,120,10,1,'SUCCESS',NOW()),
(2,2,1,350,100,2,'SUCCESS',NOW()),
(3,1,2,1800,7000,2,'SUCCESS',NOW()),
(4,3,1,2100,15000,1,'SUCCESS',NOW()),
(5,2,3,900,3000,3,'SUCCESS',NOW());