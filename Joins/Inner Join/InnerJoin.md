# INNER JOIN

## What is an INNER JOIN?

An **INNER JOIN** returns records with **matching values in both tables**.

The overlap of two tables.

If there’s no match, the row is excluded from the results.

---

## Syntax:

```sql
SELECT a.column1, b.column2
FROM tableA a
INNER JOIN tableB b
ON a.id = b.id;
```

## How it works:

- The left table is the one before the LEFT JOIN keyword — here, CUSTOMERS.

- The right table is the one after the LEFT JOIN keyword — here, ORDERS.

- Combines rows from both tables where the **join condition is true**.

- Only shows data where a relationship exists in both tables.

---

## Tables Before JOIN

### CUSTOMERS

| customer_id | first_name | last_name | email            |
| ----------- | ---------- | --------- | ---------------- |
| 1           | Boy        | George    | george@gmail.com |
| 2           | George     | Michael   | gm@gmail.com     |
| 3           | David      | Bowie     | david@gmail.com  |
| 4           | Blue       | Steele    | blue@gmail.com   |

**Primary Key:** `customer_id`

---

### ORDERS

| order_id | order_date   | amount | customer_id |
| -------- | ------------ | ------ | ----------- |
| 1        | '2016/02/10' | 99.99  | 1           |
| 2        | '2017/11/17' | 35.50  | 1           |
| 3        | '2014/12/12' | 800.67 | 2           |
| 4        | '2015/01/03' | 12.50  | 2           |

**Primary Key:** `order_id`  
**Foreign Key:** `customer_id` → `CUSTOMERS.customer_id`

---

## INNER JOIN Query:

```sql
SELECT c.first_name, c.last_name, o.amount, o.order_date
FROM CUSTOMERS c
INNER JOIN ORDERS o
ON c.id = o.customer_id;
```

## Result Table

| first_name | last_name | amount | order_date |
| ---------- | --------- | ------ | ---------- |
| Boy        | George    | 99.99  | 2016-02-10 |
| Boy        | George    | 35.50  | 2017-11-11 |
| George     | Michael   | 800.67 | 2014-12-12 |
| George     | Michael   | 12.50  | 2015-01-03 |
| Bette      | Davis     | 459.25 | 1999-04-11 |

---

## Notes:

- **David Bowie** and **Blue Steele** are excluded because they have no orders.
- Every record returned has a matching `customer_id` in both tables.

---

## Summary

- **INNER JOIN** only returns rows where the `customer_id` exists in both `CUSTOMERS` and `ORDERS`.
- Non-matching rows are excluded from the result set.
