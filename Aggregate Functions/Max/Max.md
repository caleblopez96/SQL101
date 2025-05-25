# SQL MAX() Function - Detailed Guide

The MAX() function returns the maximum (largest) value from a specified column, ignoring NULL values. It works with numeric, date, and string data types.

## Basic Syntax

```sql
MAX(column_name)
MAX(DISTINCT column_name)
MAX(expression)
```

## How MAX() Works

### Basic MAX()

Returns the largest value from all non-NULL values in a column.

```sql
-- Find the highest order amount
SELECT MAX(amount) as highest_order_amount
FROM orders;
-- Result: 800.67
```

### MAX(DISTINCT)

Returns the maximum value from unique values only (rarely needed since MAX of distinct values = MAX of all values).

```sql
-- Maximum of unique amounts (same result as regular MAX)
SELECT MAX(DISTINCT amount) as max_unique_amount
FROM orders;
-- Result: 800.67
```

## Working with Different Data Types

### Numeric Values

```sql
-- Highest order amount
SELECT MAX(amount) as highest_order
FROM orders;
-- Result: 800.67

-- Lowest order amount using MAX with negative values
SELECT -MIN(amount) as lowest_order_negative
FROM orders;
-- Just for demonstration - use MIN() instead
```

### Date Values

```sql
-- Most recent order date
SELECT MAX(order_date) as most_recent_order
FROM orders;
-- Result: 2017-11-17

-- Oldest order date using MIN for comparison
SELECT
    MAX(order_date) as newest_order,
    MIN(order_date) as oldest_order
FROM orders;
-- Results: newest: 2017-11-17, oldest: 2014-12-12
```

### String Values

```sql
-- Last customer name alphabetically
SELECT MAX(last_name) as last_alphabetical_name
FROM customers;
-- Result: 'Steele' (alphabetically last)

-- First customer name alphabetically
SELECT MIN(first_name) as first_alphabetical_name
FROM customers;
-- Result: 'Blue' (alphabetically first)
```

## Practical Examples with Sample Data

### Basic Maximum Finding

```sql
-- Highest single order value
SELECT MAX(amount) as highest_single_order
FROM orders;
-- Result: 800.67

-- Format for currency display
SELECT CONCAT('$', FORMAT(MAX(amount), 2)) as formatted_highest_order
FROM orders;
-- Result: $800.67
```

### MAX() with Conditions (WHERE clause)

```sql
-- Highest order amount from 2016 or later
SELECT MAX(amount) as highest_recent_order
FROM orders
WHERE order_date >= '2016-01-01';
-- Result: 99.99

-- Highest order amount from customer 1
SELECT MAX(amount) as customer_1_highest_order
FROM orders
WHERE customer_id = 1;
-- Result: 99.99

-- Highest order amount under $100
SELECT MAX(amount) as highest_small_order
FROM orders
WHERE amount < 100;
-- Result: 99.99
```

### MAX() with GROUP BY

```sql
-- Highest order amount per customer
SELECT
    customer_id,
    MAX(amount) as highest_order_amount
FROM orders
GROUP BY customer_id;
-- Results:
-- customer_id: 1, highest_order_amount: 99.99
-- customer_id: 2, highest_order_amount: 800.67
```

### Using MAX() with JOINs

```sql
-- Each customer's highest order with full details
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COALESCE(MAX(o.amount), 0) as highest_order_amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY highest_order_amount DESC;
-- Shows all customers, with $0 for those who haven't ordered
```
