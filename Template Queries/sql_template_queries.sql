
-- Template SQL Queries

-- Basic SELECT Queries
SELECT * FROM <table_name>; 
-- Replace <table_name> with your actual table name

SELECT <column1>, <column2> FROM <table_name>; 
-- Replace <column1>, <column2> with column names you want to retrieve

-- Filtering Data with WHERE
SELECT * FROM <table_name>
WHERE <column_name> = '<value>'; 
-- Replace <column_name> and <value>

SELECT * FROM <table_name>
WHERE <column_name> BETWEEN <value1> AND <value2>; 
-- Replace with appropriate column name and range values

SELECT * FROM <table_name>
WHERE <column_name> IN ('<value1>', '<value2>', '<value3>'); 
-- Replace with column name and list of values

SELECT * FROM <table_name>
WHERE <column_name> LIKE '%<pattern>%'; 
-- Replace with pattern to search for

-- Sorting Data
SELECT * FROM <table_name>
ORDER BY <column_name> ASC; 
-- Replace <column_name> and use ASC or DESC for sorting order

SELECT * FROM <table_name>
ORDER BY <column_name> DESC;

-- Limiting Results
SELECT * FROM <table_name>
LIMIT <number>; 
-- Replace <number> with how many rows you want returned

-- Inserting Data
INSERT INTO <table_name> (<column1>, <column2>, <column3>)
VALUES ('<value1>', '<value2>', '<value3>'); 
-- Replace columns and values as needed

-- Updating Data
UPDATE <table_name>
SET <column1> = '<new_value>'
WHERE <column_name> = '<value>'; 
-- Replace values as needed

-- Deleting Data
DELETE FROM <table_name>
WHERE <column_name> = '<value>'; 
-- Use carefully, replace with your condition

-- Aggregate Functions
SELECT COUNT(*) FROM <table_name>; 
-- Counts total number of rows

SELECT SUM(<column_name>) FROM <table_name>; 
-- Adds up values in a column

SELECT AVG(<column_name>) FROM <table_name>; 
-- Calculates average of values

SELECT MIN(<column_name>) FROM <table_name>; 
-- Finds minimum value

SELECT MAX(<column_name>) FROM <table_name>; 
-- Finds maximum value

-- Joining Tables (Preview)
SELECT a.<column>, b.<column>
FROM <table_a> a
INNER JOIN <table_b> b ON a.<foreign_key> = b.<primary_key>; 
-- Replace table and column names appropriately
