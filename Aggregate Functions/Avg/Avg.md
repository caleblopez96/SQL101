# SQL AVG() Function - Detailed Guide

The AVG() function calculates the arithmetic mean (average) of all numeric values in a specified column, ignoring NULL values.

## Basic Syntax

```sql
AVG(column_name)
AVG(DISTINCT column_name)
AVG(expression)
```

## How AVG() Works

### Basic AVG()

Calculates the sum of all non-NULL values divided by the count of non-NULL values.

```sql
-- Calculate average order amount
SELECT AVG(amount) as average_order_amount
FROM orders;
-- Result: 237.165 (948.66 ÷ 4 = 237.165)
```

### AVG(DISTINCT)

Calculates the average of only unique values in a column.

```sql
-- Average of unique order amounts
SELECT AVG(DISTINCT amount) as avg_unique_amounts
FROM orders;
-- Result: 237.165 (same as regular AVG since all amounts are unique)
```

## Practical Examples with Sample Data

### Basic Average Calculations

```sql
-- Average order value
SELECT AVG(amount) as average_order_value
FROM orders;
-- Result: 237.165

-- Formatted average for display
SELECT
    CONCAT('$', FORMAT(AVG(amount), 2)) as formatted_avg_order_value
FROM orders;
-- Result: $237.17
```

### AVG() with Conditions (WHERE clause)

```sql
-- Average order amount for recent orders (2016+)
SELECT AVG(amount) as recent_avg_order_value
FROM orders
WHERE order_date >= '2016-01-01';
-- Result: 67.745 ((99.99 + 35.50) ÷ 2)

-- Average of large orders (over $50)
SELECT AVG(amount) as avg_large_order
FROM orders
WHERE amount > 50;
-- Result: 450.33 ((99.99 + 800.67) ÷ 2)

-- Average of small orders (under $50)
SELECT AVG(amount) as avg_small_order
FROM orders
WHERE amount < 50;
-- Result: 24.00 ((35.50 + 12.50) ÷ 2)
```

### AVG() with GROUP BY

```sql
-- Average order value per customer
SELECT
    customer_id,
    AVG(amount) as avg_order_value,
    COUNT(*) as order_count
FROM orders
GROUP BY customer_id;
-- Results:
-- customer_id: 1, avg_order_value: 67.745, order_count: 2
-- customer_id: 2, avg_order_value: 406.585, order_count: 2

-- Average order value by year
SELECT
    YEAR(order_date) as order_year,
    AVG(amount) as yearly_avg_order_value,
    COUNT(*) as orders_that_year
FROM orders
GROUP BY YEAR(order_date)
ORDER BY order_year;
-- Results show average order value for each year
```

### Advanced AVG() Examples

```sql
-- Compare each order to the overall average
SELECT
    order_id,
    amount,
    AVG(amount) OVER () as overall_average,
    amount - AVG(amount) OVER () as difference_from_avg,
    CASE
        WHEN amount > AVG(amount) OVER () THEN 'Above Average'
        WHEN amount < AVG(amount) OVER () THEN 'Below Average'
        ELSE 'Exactly Average'
    END as comparison
FROM orders;

-- Moving average (requires window functions)
SELECT
    order_id,
    order_date,
    amount,
    AVG(amount) OVER (ORDER BY order_date ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) as moving_avg
FROM orders
ORDER BY order_date;
```

### Using AVG() with JOINs

```sql
-- Average order value per customer with customer details
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) as order_count,
    COALESCE(AVG(o.amount), 0) as avg_order_value
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY avg_order_value DESC;
-- Shows all customers including those with no orders (avg = 0)

-- Customer segmentation based on average order value
SELECT
    c.first_name,
    c.last_name,
    AVG(o.amount) as avg_order_value,
    CASE
        WHEN AVG(o.amount) >= 300 THEN 'High Value'
        WHEN AVG(o.amount) >= 100 THEN 'Medium Value'
        WHEN AVG(o.amount) > 0 THEN 'Low Value'
        ELSE 'No Orders'
    END as customer_segment
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;
```
