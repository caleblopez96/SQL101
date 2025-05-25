# SQL COUNT() Function - Detailed Guide

The COUNT() function returns the number of rows that match a specified condition or the total number of rows in a table.

## Basic Syntax

```sql
COUNT(expression)
COUNT(*)
COUNT(DISTINCT expression)
```

## Types of COUNT()

### COUNT(\*)

Counts all rows in a table, including rows with NULL values.

```sql
-- Count total number of customers
SELECT COUNT(*) as total_customers
FROM customers;
-- Result: 4
```

### COUNT(column_name)

Counts the number of non-NULL values in a specific column.

```sql
-- Count customers with email addresses (non-NULL emails)
SELECT COUNT(email) as customers_with_email
FROM customers;
-- Result: 4 (all customers have emails in our sample data)
```

### COUNT(DISTINCT column_name)

Counts the number of unique (distinct) non-NULL values in a column.

```sql
-- Count unique customers who have placed orders
SELECT COUNT(DISTINCT customer_id) as unique_customers_with_orders
FROM orders;
-- Result: 2 (only customers 1 and 2 have orders)
```

## Practical Examples with Sample Data

### Basic Counting

```sql
-- Total number of orders
SELECT COUNT(*) as total_orders
FROM orders;
-- Result: 4

-- Count orders with amounts (non-NULL amounts)
SELECT COUNT(amount) as orders_with_amounts
FROM orders;
-- Result: 4
```

### Counting with Conditions (WHERE clause)

```sql
-- Count orders from 2016 or later
SELECT COUNT(*) as recent_orders
FROM orders
WHERE order_date >= '2016-01-01';
-- Result: 2

-- Count orders over $50
SELECT COUNT(*) as large_orders
FROM orders
WHERE amount > 50;
-- Result: 2
```

### Counting with GROUP BY

```sql
-- Count orders per customer
SELECT
    customer_id,
    COUNT(*) as order_count
FROM orders
GROUP BY customer_id;
-- Results:
-- customer_id: 1, order_count: 2
-- customer_id: 2, order_count: 2
```

### Using COUNT() with JOINs

```sql
-- Count orders for each customer, including customers with no orders
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) as order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY c.customer_id;
-- Results show all 4 customers, with order counts (0 for customers 3 and 4)
```

## Important Notes

### NULL Behavior

- `COUNT(*)` includes rows with NULL values
- `COUNT(column_name)` excludes NULL values
- `COUNT(DISTINCT column_name)` excludes NULL values and counts unique values only

```sql
-- Example demonstrating NULL handling
-- If we had a customer with NULL email:
SELECT
    COUNT(*) as total_rows,           -- Includes NULLs
    COUNT(email) as non_null_emails,  -- Excludes NULLs
    COUNT(DISTINCT email) as unique_emails  -- Excludes NULLs, counts unique
FROM customers;
```

### Performance Considerations

- `COUNT(*)` is typically the fastest as it doesn't need to check column values
- `COUNT(column_name)` may be slower on large tables as it checks for NULLs
- `COUNT(DISTINCT column_name)` is the slowest as it must identify unique values

### Common Mistakes

- Don't use `COUNT(1)` instead of `COUNT(*)` - while functionally equivalent, `COUNT(*)` is clearer
- Remember that `COUNT()` never returns NULL - it returns 0 if no rows match
- When using `GROUP BY`, each group gets its own count

## Summary

- `COUNT(*)` counts all rows including NULLs
- `COUNT(column)` counts non-NULL values in a specific column
- `COUNT(DISTINCT column)` counts unique non-NULL values
- Use with `WHERE` to count rows meeting specific conditions
- Use with `GROUP BY` to count rows within each group
- Always returns a number (never NULL) - returns 0 if no matches found
