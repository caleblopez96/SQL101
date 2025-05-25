# SQL 101 Cheatsheet

## Basic Query Structure

```sql
SELECT column1, column2
FROM table_name
WHERE condition
ORDER BY column1;
```

## Essential Commands

### SELECT - Getting Data

```sql
-- Get all columns
SELECT * FROM customers;

-- Get specific columns
SELECT first_name, last_name FROM customers;

-- Get data with conditions
SELECT * FROM customers WHERE customer_id = 1;
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
INNER JOIN orders ON customers.customer_id = orders.customer_id;
```

### LEFT JOIN - All records from left table

```sql
SELECT customers.first_name, orders.amount
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;
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

## Common Examples with Our Tables

### Get customer names with their order amounts

```sql
SELECT c.first_name, c.last_name, o.amount, o.order_date
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
ORDER BY o.order_date DESC;
```

### Find customers who haven't placed orders

```sql
SELECT c.first_name, c.last_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;
```

### Get total spent by each customer

```sql
SELECT c.first_name, c.last_name, SUM(o.amount) as total_spent
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;
```

### Find customers with orders over $100

```sql
SELECT DISTINCT c.first_name, c.last_name
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
WHERE o.amount > 100;
```

## Key Concepts

**Primary Key**: Unique identifier for each row (like `customer_id` in customers table)

**Foreign Key**: Links to primary key in another table (like `customer_id` in orders table)

**JOIN**: Combines data from multiple tables based on related columns

**GROUP BY**: Groups rows with same values (used with aggregate functions)

**DISTINCT**: Returns only unique values

## Quick Tips

- Use table aliases (`c` for customers, `o` for orders) to make queries cleaner
- Always specify which table a column comes from in joins: `customers.customer_id`
- Start simple and build up complex queries step by step
- Use `LIMIT` when testing to avoid huge result sets
