# SQL UPDATE Statement Overview and Examples

The `UPDATE` statement is used to modify existing data in one or more tables in a database.

---

## Basic Syntax

```sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```

To update all rows (use with caution):

```sql
UPDATE table_name
SET column1 = value1;
```

---

## Updating Specific Columns

You can specify which columns to modify:

```sql
UPDATE customers
SET first_name = 'Jane', last_name = 'Smith'
WHERE customer_id = 1;
```

---

## Filtering with WHERE

To update rows based on conditions:

```sql
UPDATE customers
SET city = 'Los Angeles'
WHERE city = 'Phoenix';
```

---

## Using Expressions

To update using calculations or functions:

```sql
UPDATE orders
SET total_amount = amount * 1.08
WHERE order_date > '2023-01-01';
```

---

## Using Subqueries

Subqueries can provide values for updates:

```sql
UPDATE customers
SET status = 'VIP'
WHERE customer_id IN (SELECT customer_id FROM orders WHERE amount > 1000);
```

---

## Combining Conditions with AND, OR

```sql
UPDATE orders
SET status = 'shipped'
WHERE amount > 100 AND order_date > '2023-01-01';
```

---

## Limiting Updates

MySQL supports LIMIT in UPDATE:

```sql
UPDATE customers
SET status = 'inactive'
WHERE last_login < '2022-01-01'
LIMIT 10;
```

SQL Server supports TOP:

```sql
UPDATE TOP (10) customers
SET status = 'inactive'
WHERE last_login < '2022-01-01';
```

---

## Updating with JOINs (Preview)

```sql
UPDATE customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
SET c.total_spent = o.amount;
```

---

This file covers the basics of UPDATE statements with common clauses.
