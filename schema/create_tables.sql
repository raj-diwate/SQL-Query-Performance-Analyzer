CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `queries` (
  `query_id` int NOT NULL AUTO_INCREMENT,
  `query_text` text,
  PRIMARY KEY (`query_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `query_logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `query_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `database_id` int DEFAULT NULL,
  `execution_time_ms` int DEFAULT NULL,
  `rows_examined` int DEFAULT NULL,
  `rows_returned` int DEFAULT NULL,
  `execution_status` varchar(20) DEFAULT NULL,
  `executed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `idx_query_id` (`query_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_database_id` (`database_id`),
  KEY `idx_execution_time` (`execution_time_ms`),
  CONSTRAINT `query_logs_ibfk_1` FOREIGN KEY (`query_id`) REFERENCES `queries` (`query_id`),
  CONSTRAINT `query_logs_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `query_logs_ibfk_3` FOREIGN KEY (`database_id`) REFERENCES `db_list` (`database_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `db_list` (
  `database_id` int NOT NULL AUTO_INCREMENT,
  `database_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`database_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

