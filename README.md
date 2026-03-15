# SQL Query Performance Analyzer

**SQL-only project to monitor and analyze query performance across databases.**  

---

## Key Features
- **Slow Queries:** Identifies queries with highest execution time  
- **Frequent Queries:** Tracks most commonly executed queries  
- **Inefficient Queries:** Detects queries examining many rows but returning few  

---

## Project Structure


schema/ -> Table and index creation scripts
analytics/ -> Views for performance analytics
automation/ -> Stored procedures and triggers
sample_data/ -> Sample users, queries, databases, and logs
README.md -> Project documentation


---

## Setup & Usage

1. Create database:

```sql
CREATE DATABASE query_insights;
USE query_insights;

Run schema and indexes:

SOURCE schema/create_tables.sql;
SOURCE schema/create_indexes.sql;

Create analytics views:

SOURCE analytics/views.sql;

Add stored procedures:

SOURCE automation/stored_procedures.sql;

Insert sample data:

SOURCE sample_data/insert_sample_data.sql;

Generate report:

CALL query_performance_report();


# Example Analytics Queries (from query_logs)
Sample Data :
SELECT *
FROM query_logs
LIMIT 10;


+--------+----------+---------+-------------+-------------------+---------------+---------------+------------------+---------------------+
| log_id | query_id | user_id | database_id | execution_time_ms | rows_examined | rows_returned | execution_status | executed_at         |
+--------+----------+---------+-------------+-------------------+---------------+---------------+------------------+---------------------+
|      1 |        1 |       1 |           1 |               120 |           500 |             1 | success          | 2026-03-14 19:42:14 |
|      2 |        2 |       2 |           1 |               450 |          2000 |             1 | success          | 2026-03-14 19:42:14 |
|      3 |        3 |       3 |           1 |               800 |          4000 |             2 | success          | 2026-03-14 19:42:14 |
|      4 |        4 |       4 |           2 |              1500 |         10000 |             5 | success          | 2026-03-14 19:42:14 |
|      5 |        5 |       5 |           2 |               300 |          1200 |             3 | success          | 2026-03-14 19:42:14 |
|      6 |        6 |       6 |           3 |              2000 |         15000 |             1 | success          | 2026-03-14 19:42:14 |
|      7 |        7 |       7 |           3 |                90 |           200 |             1 | success          | 2026-03-14 19:42:14 |
|      8 |        8 |       8 |           4 |               400 |          3000 |             2 | success          | 2026-03-14 19:42:14 |
|      9 |        9 |       9 |           4 |               600 |          5000 |             4 | success          | 2026-03-14 19:42:14 |
|     10 |       10 |      10 |           5 |              1800 |         12000 |             6 | success          | 2026-03-14 19:42:14 |
+--------+----------+---------+-------------+-------------------+---------------+---------------+------------------+---------------------+

Top 5 Slowest Queries:
SELECT log_id, query_id, user_id, database_id, execution_time_ms, executed_at
FROM query_logs
ORDER BY execution_time_ms DESC
LIMIT 5;


+--------+----------+---------+-------------+-------------------+---------------------+
| log_id | query_id | user_id | database_id | execution_time_ms | executed_at         |
+--------+----------+---------+-------------+-------------------+---------------------+
|     36 |        1 |       1 |           1 |              3000 | 2026-03-14 23:52:36 |
|     15 |       15 |      15 |           5 |              2100 | 2026-03-14 19:42:14 |
|      6 |        6 |       6 |           3 |              2000 | 2026-03-14 19:42:14 |
|     10 |       10 |      10 |           5 |              1800 | 2026-03-14 19:42:14 |
|     19 |       19 |      19 |           4 |              1700 | 2026-03-14 19:42:14 |
+--------+----------+---------+-------------+-------------------+---------------------+


Most Frequent Queries:
SELECT query_id, COUNT(*) AS execution_count
FROM query_logs
GROUP BY query_id
ORDER BY execution_count DESC
LIMIT 5;


    -> LIMIT 5;
+----------+-----------------+
| query_id | execution_count |
+----------+-----------------+
|        1 |               8 |
|        2 |               5 |
|        3 |               5 |
|        4 |               2 |
|        5 |               1 |
+----------+-----------------+


Queries per User:
SELECT user_id, COUNT(*) AS total_queries, AVG(execution_time_ms) AS avg_exec_time_ms
FROM query_logs
GROUP BY user_id
ORDER BY total_queries DESC;


+---------+---------------+------------------+
| user_id | total_queries | avg_exec_time_ms |
+---------+---------------+------------------+
|       2 |             7 |         385.7143 |
|       5 |             5 |         628.0000 |
|       3 |             3 |         500.0000 |
|       4 |             3 |         666.6667 |
|       1 |             2 |        1560.0000 |
|       6 |             2 |        1750.0000 |
|       7 |             1 |          90.0000 |
|       8 |             1 |         400.0000 |
|       9 |             1 |         600.0000 |
|      10 |             1 |        1800.0000 |
|      11 |             1 |         250.0000 |
|      12 |             1 |         700.0000 |
|      13 |             1 |        1600.0000 |
|      14 |             1 |         350.0000 |
|      15 |             1 |        2100.0000 |
|      16 |             1 |         500.0000 |
|      17 |             1 |          75.0000 |
|      18 |             1 |        1300.0000 |
|      19 |             1 |        1700.0000 |
|      20 |             1 |         220.0000 |
+---------+---------------+------------------+


Slowest Query per User:
SELECT user_id, query_id, MAX(execution_time_ms) AS slowest_query_time
FROM query_logs
GROUP BY user_id, query_id
ORDER BY slowest_query_time DESC
LIMIT 5;

+---------+----------+--------------------+
| user_id | query_id | slowest_query_time |
+---------+----------+--------------------+
|       1 |        1 |               3000 |
|      15 |       15 |               2100 |
|       6 |        6 |               2000 |
|      10 |       10 |               1800 |
|      19 |       19 |               1700 |
+---------+----------+--------------------+



# Next Steps / Extensions

This project can be extended further to provide more advanced SQL-based performance insights:

Dedicated Views for Analytics

slow_queries – a view that automatically identifies queries exceeding a defined execution time threshold.

frequent_queries – a view summarizing the most commonly executed queries across all users.

inefficient_queries – a view detecting queries that examine many rows but return very few results.

Automated Reporting via Stored Procedures

query_performance_report() – a stored procedure that generates a consolidated report of:

Slowest queries

Most frequent queries

Queries per user

Inefficient queries

Can be scheduled via events or cron jobs for periodic monitoring.

Per-User & Per-Database Analytics

Track query patterns for individual users or databases.

Identify top resource consumers or potential optimization targets.

Performance Metrics & Alerts

Add columns for CPU/IO usage or other metrics if your MySQL setup allows.

Trigger alerts when execution time or rows examined exceed thresholds.

Visualization / Dashboard Integration (Optional)

Export query analytics to visualization tools like Grafana or Tableau for graphical dashboards.

Display trends, slow query spikes, or top resource-intensive queries visually.



# Technologies

MySQL - database engine

SQL Views & Indexes - for performance analytics

Stored Procedures - for automated reporting

Author:  Raj Diwate

---

