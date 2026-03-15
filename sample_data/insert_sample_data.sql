-- Databases
INSERT INTO db_list (database_id, database_name) VALUES
(1, 'ecommerce'),
(2, 'analytics'),
(3, 'inventory'),
(4, 'payments'),
(5, 'reporting');

-- Users
INSERT INTO users (user_id, username) VALUES
(1,'admin'),(2,'app_user'),(3,'report_user'),(4,'data_engineer'),
(5,'backend_service'),(6,'analytics_user'),(7,'etl_user'),(8,'dashboard_user'),
(9,'mobile_api'),(10,'web_api'),(11,'inventory_service'),(12,'payment_service'),
(13,'order_service'),(14,'support_user'),(15,'audit_user'),(16,'log_reader'),
(17,'marketing_user'),(18,'sales_user'),(19,'finance_user'),(20,'research_user'),
(21,'qa_user'),(22,'testing_bot'),(23,'batch_processor'),(24,'data_scientist'),
(25,'monitoring_tool'),(26,'cache_service'),(27,'search_service'),(28,'recommendation_engine'),
(29,'notification_service'),(30,'backup_service');

-- Queries
INSERT INTO queries (query_id, query_text) VALUES
(1,'SELECT * FROM orders WHERE order_id = ?'),
(2,'SELECT * FROM users WHERE email = ?'),
(3,'SELECT * FROM products WHERE category_id = ?'),
(4,'SELECT * FROM orders WHERE user_id = ?'),
(5,'SELECT * FROM order_items WHERE order_id = ?'),
(6,'UPDATE orders SET status = ? WHERE order_id = ?'),
(7,'UPDATE users SET last_login = NOW() WHERE user_id = ?'),
(8,'INSERT INTO orders (user_id,total_amount) VALUES (?,?)'),
(9,'INSERT INTO order_items (order_id,product_id,qty) VALUES (?,?,?)'),
(10,'SELECT * FROM products WHERE price > ?'),
(11,'SELECT COUNT(*) FROM orders'),
(12,'SELECT * FROM users WHERE created_at > ?'),
(13,'SELECT * FROM products ORDER BY price DESC'),
(14,'SELECT * FROM orders ORDER BY created_at DESC'),
(15,'DELETE FROM sessions WHERE last_active < ?'),
(16,'SELECT * FROM inventory WHERE product_id = ?'),
(17,'UPDATE inventory SET stock = stock - ? WHERE product_id = ?'),
(18,'SELECT * FROM payments WHERE order_id = ?'),
(19,'INSERT INTO payments (order_id,amount) VALUES (?,?)'),
(20,'SELECT * FROM shipments WHERE order_id = ?'),
(21,'SELECT * FROM reviews WHERE product_id = ?'),
(22,'SELECT AVG(price) FROM products'),
(23,'SELECT SUM(total_amount) FROM orders'),
(24,'SELECT * FROM carts WHERE user_id = ?'),
(25,'DELETE FROM carts WHERE user_id = ?'),
(26,'SELECT * FROM wishlist WHERE user_id = ?'),
(27,'INSERT INTO wishlist (user_id,product_id) VALUES (?,?)'),
(28,'SELECT * FROM coupons WHERE code = ?'),
(29,'UPDATE coupons SET used = 1 WHERE code = ?'),
(30,'SELECT * FROM transactions WHERE user_id = ?'),
(31,'SELECT * FROM users');

-- -----------------------------
-- Sample data for frequent_queries
-- -----------------------------
INSERT INTO frequent_queries (query_text, execution_count) VALUES
('SELECT * FROM orders WHERE order_id = ?', 8),
('SELECT * FROM users WHERE email = ?', 5),
('SELECT * FROM products WHERE category_id = ?', 5),
('SELECT * FROM orders WHERE user_id = ?', 2),
('SELECT * FROM order_items WHERE order_id = ?', 1),
('UPDATE orders SET status = ? WHERE order_id = ?', 1),
('UPDATE users SET last_login = NOW() WHERE user_id = ?', 1),
('INSERT INTO orders (user_id,total_amount) VALUES (?,?)', 1),
('INSERT INTO order_items (order_id,product_id,qty) VALUES (?,?,?)', 1),
('SELECT * FROM products WHERE price > ?', 1),
('SELECT COUNT(*) FROM orders', 1),
('SELECT * FROM users WHERE created_at > ?', 1),
('SELECT * FROM products ORDER BY price DESC', 1),
('SELECT * FROM orders ORDER BY created_at DESC', 1),
('DELETE FROM sessions WHERE last_active < ?', 1),
('SELECT * FROM inventory WHERE product_id = ?', 1),
('UPDATE inventory SET stock = stock - ? WHERE product_id = ?', 1),
('SELECT * FROM payments WHERE order_id = ?', 1),
('INSERT INTO payments (order_id,amount) VALUES (?,?)', 1),
('SELECT * FROM shipments WHERE order_id = ?', 1),
('SELECT * FROM users', 1);

-- -----------------------------
-- Sample data for inefficient_queries
-- -----------------------------
INSERT INTO inefficient_queries (query_text, rows_examined, rows_returned, inefficiency_ratio) VALUES
('UPDATE orders SET status = ? WHERE order_id = ?', 15000, 1, 15000.0000),
('SELECT * FROM orders WHERE order_id = ?', 10000, 1, 10000.0000),
('SELECT * FROM users WHERE created_at > ?', 3500, 1, 3500.0000),
('SELECT * FROM payments WHERE order_id = ?', 7000, 2, 3500.0000),
('SELECT * FROM orders WHERE user_id = ?', 10000, 3, 3333.3333),
('SELECT * FROM users WHERE email = ?', 3200, 1, 3200.0000),
('SELECT * FROM users WHERE email = ?', 3200, 1, 3200.0000),
('SELECT * FROM users WHERE email = ?', 3100, 1, 3100.0000),
('SELECT * FROM users WHERE email = ?', 3000, 1, 3000.0000),
('DELETE FROM sessions WHERE last_active < ?', 20000, 7, 2857.1429),
('SELECT * FROM products WHERE category_id = ?', 5200, 2, 2600.0000),
('SELECT * FROM products WHERE category_id = ?', 5200, 2, 2600.0000),
('SELECT * FROM products WHERE category_id = ?', 5000, 2, 2500.0000),
('SELECT * FROM products WHERE category_id = ?', 5000, 2, 2500.0000),
('SELECT * FROM products ORDER BY price DESC', 9000, 4, 2250.0000),
('SELECT * FROM users WHERE email = ?', 2000, 1, 2000.0000),
('SELECT * FROM products WHERE category_id = ?', 4000, 2, 2000.0000),
('SELECT * FROM orders WHERE user_id = ?', 10000, 5, 2000.0000),
('SELECT * FROM orders WHERE order_id = ?', 2000, 1, 2000.0000),
('SELECT * FROM products WHERE price > ?', 12000, 6, 2000.0000),
('SELECT * FROM orders WHERE order_id = ?', 2000, 1, 2000.0000),
('INSERT INTO payments (order_id,amount) VALUES (?,?)', 9500, 5, 1900.0000),
('SELECT * FROM orders ORDER BY created_at DESC', 1800, 1, 1800.0000),
('INSERT INTO orders (user_id,total_amount) VALUES (?,?)', 3000, 2, 1500.0000),
('SELECT * FROM orders WHERE order_id = ?', 1500, 1, 1500.0000),
('SELECT * FROM orders WHERE order_id = ?', 1500, 1, 1500.0000),
('INSERT INTO order_items (order_id,product_id,qty) VALUES (?,?,?)', 5000, 4, 1250.0000),
('SELECT * FROM inventory WHERE product_id = ?', 3000, 3, 1000.0000),
('SELECT * FROM orders WHERE order_id = ?', 900, 1, 900.0000),
('SELECT * FROM orders WHERE order_id = ?', 900, 1, 900.0000),
('SELECT * FROM shipments WHERE order_id = ?', 800, 1, 800.0000),
('SELECT * FROM orders WHERE order_id = ?', 500, 1, 500.0000),
('SELECT COUNT(*) FROM orders', 900, 2, 450.0000),
('SELECT * FROM order_items WHERE order_id = ?', 1200, 3, 400.0000),
('UPDATE users SET last_login = NOW() WHERE user_id = ?', 200, 1, 200.0000),
('UPDATE inventory SET stock = stock - ? WHERE product_id = ?', 100, 1, 100.0000);

-- -----------------------------
-- Sample data for slow_queries
-- -----------------------------
INSERT INTO slow_queries (query_text, avg_execution_time) VALUES
('DELETE FROM sessions WHERE last_active < ?', 2100.0000),
('UPDATE orders SET status = ? WHERE order_id = ?', 2000.0000),
('SELECT * FROM products WHERE price > ?', 1800.0000),
('INSERT INTO payments (order_id,amount) VALUES (?,?)', 1700.0000),
('SELECT * FROM products ORDER BY price DESC', 1600.0000),
('SELECT * FROM orders WHERE user_id = ?', 1500.0000),
('SELECT * FROM payments WHERE order_id = ?', 1300.0000),
('SELECT * FROM products WHERE category_id = ?', 728.0000),
('SELECT * FROM users WHERE created_at > ?', 700.0000),
('SELECT * FROM orders WHERE order_id = ?', 615.0000),
('INSERT INTO order_items (order_id,product_id,qty) VALUES (?,?,?)', 600.0000),
('SELECT * FROM inventory WHERE product_id = ?', 500.0000),
('SELECT * FROM users WHERE email = ?', 420.0000),
('INSERT INTO orders (user_id,total_amount) VALUES (?,?)', 400.0000),
('SELECT * FROM orders ORDER BY created_at DESC', 350.0000),
('SELECT * FROM order_items WHERE order_id = ?', 300.0000),
('SELECT COUNT(*) FROM orders', 250.0000),
('SELECT * FROM shipments WHERE order_id = ?', 220.0000),
('UPDATE users SET last_login = NOW() WHERE user_id = ?', 90.0000),
('UPDATE inventory SET stock = stock - ? WHERE product_id = ?', 75.0000),
('SELECT * FROM users', NULL);

-- -----------------------------
-- Sample data for query_logs
-- -----------------------------
INSERT INTO query_logs (log_id, query_id, user_id, database_id, execution_time_ms, rows_examined, rows_returned, execution_status, executed_at) VALUES
(1,1,1,1,120,500,1,'success','2026-03-14 19:42:14'),
(2,2,2,1,450,2000,1,'success','2026-03-14 19:42:14'),
(3,3,3,1,800,4000,2,'success','2026-03-14 19:42:14'),
(4,4,4,2,1500,10000,5,'success','2026-03-14 19:42:14'),
(5,5,5,2,300,1200,3,'success','2026-03-14 19:42:14'),
(6,6,6,3,2000,15000,1,'success','2026-03-14 19:42:14'),
(7,7,7,3,90,200,1,'success','2026-03-14 19:42:14'),
(8,8,8,4,400,3000,2,'success','2026-03-14 19:42:14'),
(9,9,9,4,600,5000,4,'success','2026-03-14 19:42:14'),
(10,10,10,5,1800,12000,6,'success','2026-03-14 19:42:14'),
(11,11,11,1,250,900,2,'success','2026-03-14 19:42:14'),
(12,12,12,2,700,3500,1,'success','2026-03-14 19:42:14'),
(13,13,13,3,1600,9000,4,'success','2026-03-14 19:42:14'),
(14,14,14,4,350,1800,1,'success','2026-03-14 19:42:14'),
(15,15,15,5,2100,20000,7,'success','2026-03-14 19:42:14'),
(16,16,16,1,500,3000,3,'success','2026-03-14 19:42:14'),
(17,17,17,2,75,100,1,'success','2026-03-14 19:42:14'),
(18,18,18,3,1300,7000,2,'success','2026-03-14 19:42:14'),
(19,19,19,4,1700,9500,5,'success','2026-03-14 19:42:14'),
(20,20,20,5,220,800,1,'success','2026-03-14 19:42:14'),
(21,1,2,1,300,1500,1,'success','2026-03-14 23:08:53'),
(22,1,3,1,350,2000,1,'success','2026-03-14 23:08:53'),
(23,1,4,1,250,900,1,'success','2026-03-14 23:08:53'),
(24,2,2,1,400,3000,1,'success','2026-03-14 23:08:53'),
(25,2,2,1,420,3200,1,'success','2026-03-14 23:08:53'),
(26,3,5,2,700,5000,2,'success','2026-03-14 23:08:53'),
(27,3,5,2,720,5200,2,'success','2026-03-14 23:08:53'),
(28,4,6,3,1500,10000,3,'success','2026-03-14 23:08:53'),
(29,1,2,1,300,1500,1,'success','2026-03-14 23:14:13'),
(30,1,3,1,350,2000,1,'success','2026-03-14 23:14:13'),
(31,1,4,1,250,900,1,'success','2026-03-14 23:14:13'),
(32,2,2,1,420,3200,1,'success','2026-03-14 23:14:13'),
(33,2,2,1,410,3100,1,'success','2026-03-14 23:14:13'),
(34,3,5,2,700,5000,2,'success','2026-03-14 23:14:13'),
(35,3,5,2,720,5200,2,'success','2026-03-14 23:14:13'),
(36,1,1,1,3000,10000,1,'SUCCESS','2026-03-14 23:52:36'),
(37,31,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

-- -----------------------------
-- Sample data for slow_query_log
-- -----------------------------
INSERT INTO slow_query_log (slow_log_id, log_id, query_id, execution_time_ms, logged_at) VALUES
(1,36,1,3000,'2026-03-14 23:52:36');
