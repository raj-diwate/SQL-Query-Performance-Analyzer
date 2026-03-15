Query 1 — Top 10 Slowest Queries by Average Execution Time
-- Top 10 slowest SELECT queries by average execution time
SELECT
    DIGEST_TEXT AS query,
    COUNT_STAR AS calls,
    SUM_TIMER_WAIT / 1000000000000 AS total_exec_time_sec,
    (SUM_TIMER_WAIT / COUNT_STAR) / 1000000000000 AS avg_time_sec
FROM performance_schema.events_statements_summary_by_digest
WHERE DIGEST_TEXT LIKE 'SELECT%'
ORDER BY avg_time_sec DESC
LIMIT 10;

Query 2 — Top 10 Most Frequently Executed Queries
-- Top 10 most frequently executed SELECT queries
SELECT
    DIGEST_TEXT AS query,
    COUNT_STAR AS calls,
    SUM_TIMER_WAIT / 1000000000000 AS total_exec_time_sec
FROM performance_schema.events_statements_summary_by_digest
WHERE DIGEST_TEXT LIKE 'SELECT%'
ORDER BY calls DESC
LIMIT 10;

Query 3 — Queries by Total Execution Time
-- Queries consuming the most total execution time
SELECT
    DIGEST_TEXT AS query,
    SUM_TIMER_WAIT / 1000000000000 AS total_exec_time_sec,
    COUNT_STAR AS calls
FROM performance_schema.events_statements_summary_by_digest
WHERE DIGEST_TEXT LIKE 'SELECT%'
ORDER BY total_exec_time_sec DESC
LIMIT 10;

Query 4 — Most Accessed Tables
-- Top 10 tables by total access count (reads + writes)
SELECT
    OBJECT_SCHEMA AS table_schema,
    OBJECT_NAME AS table_name,
    COUNT_READ + COUNT_WRITE AS total_access_count
FROM performance_schema.table_io_waits_summary_by_table
WHERE OBJECT_SCHEMA NOT IN ('mysql', 'performance_schema', 'information_schema', 'sys')
ORDER BY total_access_count DESC
LIMIT 10;

Query 5 — Tables with Most Reads
-- Top 10 read-heavy tables
SELECT
    OBJECT_SCHEMA AS table_schema,
    OBJECT_NAME AS table_name,
    COUNT_READ AS reads
FROM performance_schema.table_io_waits_summary_by_table
WHERE OBJECT_SCHEMA NOT IN ('mysql', 'performance_schema', 'information_schema', 'sys')
ORDER BY reads DESC
LIMIT 10;

Query 6 — Tables with Most Writes
-- Top 10 write-heavy tables
SELECT
    OBJECT_SCHEMA AS table_schema,
    OBJECT_NAME AS table_name,
    COUNT_WRITE AS writes
FROM performance_schema.table_io_waits_summary_by_table
WHERE OBJECT_SCHEMA NOT IN ('mysql', 'performance_schema', 'information_schema', 'sys')
ORDER BY writes DESC
LIMIT 10;

Query 7 — Queries Causing the Most Locks
-- Queries with highest lock wait times
SELECT
    DIGEST_TEXT AS query,
    SUM_LOCK_TIME / 1000000000000 AS total_lock_time_sec,
    COUNT_STAR AS calls
FROM performance_schema.events_statements_summary_by_digest
WHERE SUM_LOCK_TIME > 0
ORDER BY total_lock_time_sec DESC
LIMIT 10;

Query 8 — Queries with Most Rows Examined
-- Queries that examined the most rows
SELECT
    DIGEST_TEXT AS query,
    SUM_ROWS_EXAMINED AS total_rows_examined,
    COUNT_STAR AS calls
FROM performance_schema.events_statements_summary_by_digest
ORDER BY total_rows_examined DESC
LIMIT 10;

Query 9 — Queries with Most Rows Returned
-- Queries that returned the most rows
SELECT
    DIGEST_TEXT AS query,
    SUM_ROWS_SENT AS total_rows_returned,
    COUNT_STAR AS calls
FROM performance_schema.events_statements_summary_by_digest
ORDER BY total_rows_returned DESC
LIMIT 10;


