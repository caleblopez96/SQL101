# SQL Aggregate Functions Overview

Use aggregate functions to perform calculations on sets of rows and return single values.

## What are Aggregate Functions?

Aggregate functions perform calculations on multiple rows of data and return a single result. They are commonly used with the `GROUP BY` clause to calculate summary statistics for groups of data.

### Basic Syntax

```sql
SELECT aggregate_function(column_name)
FROM table_name
WHERE condition
GROUP BY column_name;
```

## Common Aggregate Functions

### COUNT()

Counts the number of rows or non-null values in a column.

```sql
-- Count total number of customers
SELECT COUNT(*)
FROM customers;

-- Count total number of orders
SELECT COUNT(*)
FROM orders;

-- Count orders per customer
SELECT customer_id, COUNT(*) as order_count
FROM orders
GROUP BY customer_id;
```

### SUM()

Calculates the total sum of numeric values in a column.

```sql
-- Total revenue from all orders
SELECT SUM(amount)
FROM orders;

-- Total revenue per customer
SELECT customer_id, SUM(amount) as total_spent
FROM orders
GROUP BY customer_id;
```

### AVG()

Calculates the average (mean) of numeric values in a column.

```sql
-- Average order amount
SELECT AVG(amount)
FROM orders;

-- Average order amount per customer
SELECT customer_id, AVG(amount) as avg_order_amount
FROM orders
GROUP BY customer_id;
```

### MAX()

Returns the maximum value in a column.

```sql
-- Highest order amount
SELECT MAX(amount)
FROM orders;

-- Highest order amount per customer
SELECT customer_id, MAX(amount) as highest_order
FROM orders
GROUP BY customer_id;
```

### MIN()

Returns the minimum value in a column.

```sql
-- Lowest order amount
SELECT MIN(amount)
FROM orders;

-- Lowest order amount per customer
SELECT customer_id, MIN(amount) as lowest_order
FROM orders
GROUP BY customer_id;
```

## Using Multiple Aggregate Functions

You can use multiple aggregate functions in a single query:

```sql
-- Overall order statistics
SELECT
    COUNT(*) as total_orders,
    SUM(amount) as total_revenue,
    AVG(amount) as average_order_value,
    MAX(amount) as highest_order,
    MIN(amount) as lowest_order
FROM orders;

-- Customer order statistics with names
SELECT
    c.first_name,
    c.last_name,
    COUNT(o.order_id) as total_orders,
    SUM(o.amount) as total_spent,
    AVG(o.amount) as avg_order_value
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;
```

## Filtering Aggregate Results with HAVING

Use the `HAVING` clause to filter results after aggregation (similar to `WHERE` but for grouped data):

```sql
-- Find customers who have spent more than $100 total
SELECT customer_id, SUM(amount) as total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > 100;

-- Find customers with more than 1 order
SELECT customer_id, COUNT(*) as order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;
```

## Important Notes

- Aggregate functions ignore `NULL` values (except `COUNT(*)`)
- When using aggregate functions with other columns, you typically need `GROUP BY`
- Use `HAVING` instead of `WHERE` to filter grouped results
- `COUNT(*)` counts all rows, while `COUNT(column)` counts non-null values

## Summary

- `COUNT()` counts rows or non-null values
- `SUM()` calculates the total of numeric values
- `AVG()` calculates the average of numeric values
- `MAX()` finds the maximum value
- `MIN()` finds the minimum value

These aggregate functions are essential for data analysis and generating summary reports from your database.
