# SQL 101 Cheatsheet

## Basic Query Structure

```sql
SELECT column1, column2
FROM table_name
WHERE condition
ORDER BY column1;
```

## Basic CRUD Operations

### CREATE (INSERT)

```sql
-- Insert records
INSERT INTO {table_name} ({column1}, {column2}, ...)
VALUES
    ({value1}, {value2}, ...),
    ({value3}, {value4}, ...);
```

### READ (SELECT)

```sql
-- Get all records
SELECT * FROM {table_name};

-- Get specific columns
SELECT {column1}, {column2} FROM {table_name};

-- Get with conditions
SELECT * FROM {table_name} WHERE {condition};
```

### UPDATE

```sql
-- Update specific record(s)
UPDATE {table_name}
SET {column1} = {new_value1}, {column2} = {new_value2}
WHERE {condition};
```

### DELETE

```sql
-- Delete specific record(s)
DELETE FROM {table_name} WHERE {condition};
```

### Examples:

```sql
-- INSERT
INSERT INTO customers (first_name, last_name, email) VALUES ('John', 'Doe', 'jd@gmail.com');

-- UPDATE
UPDATE customers SET email = 'new@email.com' WHERE id = 1;

-- DELETE
DELETE FROM customers WHERE id = 3;
```

## Tables for Examples Below:

**Customers Table:**

| id  | first_name | last_name | email            |
| --- | ---------- | --------- | ---------------- |
| 1   | Boy        | George    | george@gmail.com |
| 2   | George     | Michael   | gm@gmail.com     |
| 3   | David      | Bowie     | david@gmail.com  |
| 4   | Blue       | Steele    | blue@gmail.com   |

Primary Key: `id`

**Orders Table:**

| order_id | order_date | amount | customer_id |
| -------- | ---------- | ------ | ----------- |
| 1        | 2016-02-10 | 99.99  | 1           |
| 2        | 2017-11-17 | 35.50  | 1           |
| 3        | 2014-12-12 | 800.67 | 2           |
| 4        | 2015-01-03 | 12.50  | 2           |

Primary Key: `order_id`

Foreign Key: `customer_id` references `customers.id`

## Essential Commands

### SELECT - Getting Data

```sql
-- Get all columns
SELECT * FROM customers;

-- Get specific columns
SELECT first_name, last_name FROM customers;

-- Get data with conditions
SELECT * FROM customers WHERE id = 1;
```

### WHERE - Filtering Data

```sql
-- Text matching
SELECT * FROM customers WHERE first_name = 'Boy';

-- Numbers
SELECT * FROM orders WHERE amount > 50;

-- Multiple conditions
SELECT * FROM orders WHERE amount > 50 AND customer_id = 1;

-- Pattern matching
SELECT * FROM customers WHERE email LIKE '%gmail.com';
```

### ORDER BY - Sorting Results

```sql
-- Ascending (default)
SELECT * FROM orders ORDER BY amount;

-- Descending
SELECT * FROM orders ORDER BY order_date DESC;
```

### LIMIT - Restricting Results

```sql
-- Get first 2 records
SELECT * FROM customers LIMIT 2;
```

## Joins - Combining Tables

### INNER JOIN - Only matching records

```sql
SELECT customers.first_name, customers.last_name, orders.amount
FROM customers
INNER JOIN orders ON customers.id = orders.customer_id;
```

### LEFT JOIN - All records from left table

```sql
SELECT customers.first_name, orders.amount
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id;
```

## Aggregate Functions

### COUNT, SUM, AVG, MAX, MIN

```sql
-- Count total orders
SELECT COUNT(*) FROM orders;

-- Sum all order amounts
SELECT SUM(amount) FROM orders;

-- Average order amount
SELECT AVG(amount) FROM orders;

-- Count orders per customer
SELECT customer_id, COUNT(*) as order_count
FROM orders
GROUP BY customer_id;
```

## Common Examples:

### Get customer names with their order amounts

```sql
SELECT c.first_name, c.last_name, o.amount, o.order_date
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
ORDER BY o.order_date DESC;
```

### Find customers who haven't placed orders

```sql
SELECT c.first_name, c.last_name
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.customer_id IS NULL;
```

### Get total spent by each customer

```sql
SELECT c.first_name, c.last_name, SUM(o.amount) as total_spent
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.first_name, c.last_name
ORDER BY total_spent DESC;
```

### Find customers with orders over $100

```sql
SELECT DISTINCT c.first_name, c.last_name
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
WHERE o.amount > 100;
```

## Key Concepts

**Primary Key**: Unique identifier for each row (like `id` in customers table)

**Foreign Key**: Links to primary key in another table (like `customer_id` in orders table)

**JOIN**: Combines data from multiple tables based on related columns

**GROUP BY**: Groups rows with same values (used with aggregate functions)

**DISTINCT**: Returns only unique values

## Quick Tips

- Use table aliases (`c` for customers, `o` for orders) to make queries cleaner
- Always specify which table a column comes from in joins: `customers.id`
- Start simple and build up complex queries step by step
- Use `LIMIT` when testing to avoid huge result sets
