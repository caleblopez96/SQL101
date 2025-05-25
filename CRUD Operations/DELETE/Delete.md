# SQL DELETE Statement Overview and Examples

The `DELETE` statement is used to remove existing rows from one or more tables in a database.

---

## Basic Syntax

```sql
DELETE FROM table_name
WHERE condition;
```

To delete all rows (use with extreme caution):

```sql
DELETE FROM table_name;
```

---

## Deleting Specific Rows

You can specify which rows to remove:

```sql
DELETE FROM customers
WHERE customer_id = 1;
```

---

## Filtering with WHERE

To delete rows based on conditions:

```sql
DELETE FROM customers
WHERE city = 'Phoenix';
```

---

## Using Date Conditions

To delete based on date criteria:

```sql
DELETE FROM orders
WHERE order_date < '2023-01-01';
```

---

## Using Subqueries

Subqueries can identify rows to delete:

```sql
DELETE FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders WHERE status = 'cancelled');
```

---

## Combining Conditions with AND, OR

```sql
DELETE FROM orders
WHERE amount < 10 AND order_date < '2023-01-01';
```

---

## Limiting Deletions

MySQL supports LIMIT in DELETE:

```sql
DELETE FROM customers
WHERE status = 'inactive'
LIMIT 5;
```

SQL Server supports TOP:

```sql
DELETE TOP (10) FROM customers
WHERE status = 'inactive';
```

---

## Deleting with JOINs (Preview)

```sql
DELETE c
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status = 'cancelled';
```

---
