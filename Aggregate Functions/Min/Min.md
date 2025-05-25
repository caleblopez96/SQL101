# SQL MIN() Function - Detailed Guide

The MIN() function returns the minimum (smallest) value from a specified column, ignoring NULL values. It works with numeric, date, and string data types.

## Basic Syntax

```sql
MIN(column_name)
MIN(DISTINCT column_name)
MIN(expression)
```

## How MIN() Works

### Basic MIN()

Returns the smallest value from all non-NULL values in a column.

```sql
-- Find the lowest order amount
SELECT MIN(amount) as lowest_order_amount
FROM orders;
-- Result: 12.50
```

### MIN(DISTINCT)

Returns the minimum value from unique values only (rarely needed since MIN of distinct values = MIN of all values).

```sql
-- Minimum of unique amounts (same result as regular MIN)
SELECT MIN(DISTINCT amount) as min_unique_amount
FROM orders;
-- Result: 12.50
```

## Working with Different Data Types

### Numeric Values

```sql
-- Lowest order amount
SELECT MIN(amount) as lowest_order
FROM orders;
-- Result: 12.50

-- Compare lowest and highest
SELECT
    MIN(amount) as lowest_order,
    MAX(amount) as highest_order,
    MAX(amount) - MIN(amount) as order_range
FROM orders;
-- Shows the spread between minimum and maximum orders
```

### Date Values

```sql
-- Earliest (oldest) order date
SELECT MIN(order_date) as earliest_order
FROM orders;
-- Result: 2014-12-12

-- Compare earliest and latest dates
SELECT
    MIN(order_date) as first_order_date,
    MAX(order_date) as last_order_date,
    DATEDIFF(MAX(order_date), MIN(order_date)) as days_between
FROM orders;
-- Shows business activity span
```

### String Values

```sql
-- First customer name alphabetically
SELECT MIN(last_name) as first_alphabetical_name
FROM customers;
-- Result: 'Bowie' (alphabetically first)

-- Compare first and last alphabetically
SELECT
    MIN(first_name) as first_name_alpha,
    MAX(first_name) as last_name_alpha
FROM customers;
-- Result: first: 'Blue', last: 'George'
```

## Practical Examples with Sample Data

### Basic Minimum Finding

```sql
-- Smallest order value
SELECT MIN(amount) as smallest_order
FROM orders;
-- Result: 12.50

-- Format for currency display
SELECT CONCAT('$', FORMAT(MIN(amount), 2)) as formatted_lowest_order
FROM orders;
-- Result: $12.50
```

### MIN() with Conditions (WHERE clause)

```sql
-- Lowest order amount from 2016 or later
SELECT MIN(amount) as lowest_recent_order
FROM orders
WHERE order_date >= '2016-01-01';
-- Result: 35.50

-- Lowest order amount from customer 2
SELECT MIN(amount) as customer_2_lowest_order
FROM orders
WHERE customer_id = 2;
-- Result: 12.50

-- Lowest order amount over $20
SELECT MIN(amount) as lowest_medium_order
FROM orders
WHERE amount > 20;
-- Result: 35.50
```

### MIN() with GROUP BY

```sql
-- Lowest order amount per customer
SELECT
    customer_id,
    MIN(amount) as lowest_order_amount
FROM orders
GROUP BY customer_id;
-- Results:
-- customer_id: 1, lowest_order_amount: 35.50
-- customer_id: 2, lowest_order_amount: 12.50

-- Lowest order amount by year
SELECT
    YEAR(order_date) as order_year,
    MIN(amount) as lowest_order_that_year
FROM orders
GROUP BY YEAR(order_date)
ORDER BY order_year;
-- Shows the smallest order for each year
```
