# SQL SELECT Statement Overview and Examples

The `SELECT` statement is used to retrieve data from one or more tables in a database.

---

## Basic Syntax

```sql
SELECT column1, column2, ...
FROM table_name;
```

To select all columns:

```sql
SELECT * FROM table_name;
```

---

## Selecting Specific Columns

You can specify which columns to retrieve:

```sql
SELECT first_name, last_name, email
FROM customers;
```

---

## Filtering with WHERE

To filter rows based on conditions:

```sql
SELECT *
FROM customers
WHERE city = 'Phoenix';
```

---

## Sorting with ORDER BY

To sort the results:

```sql
SELECT *
FROM customers
ORDER BY last_name ASC;
```

---

## Using Aliases

Alias names for tables or columns can make queries easier to read:

```sql
SELECT c.first_name, c.last_name, o.amount, o.order_date
FROM CUSTOMERS c
LEFT JOIN ORDERS o
ON c.id = o.customer_id;
```

---

## Combining Conditions with AND, OR

```sql
SELECT *
FROM orders
WHERE amount > 100 AND order_date > '2023-01-01';
```

---

## Limiting Results

LIMIT is supported in MySQL, PostgreSQL, SQLite.

```sql
SELECT *
FROM customers
LIMIT 5;
```

TOP is supported in SQL Server, MS Access.

```sql
SELECT top 10 *
FROM customers
```

---

## Joining Tables (Preview)

```sql
SELECT c.first_name, o.amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;
```

---

This file covers the basics of SELECT statements with common clauses.
