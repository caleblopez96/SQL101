# Cross Joins

A **CROSS JOIN** takes every row from one table and combines it with every row from another table.

It returns the **Cartesian product** of the two tables.

It's not a very helpful join to learn because theres no order in which things are ordered.

---

## Basic Syntax

```sql
SELECT *
FROM table1
CROSS JOIN table2;
```

---

## Technically This Is a Cross Join Too

You don’t have to explicitly use `CROSS JOIN` — listing tables separated by commas in the `FROM` clause does the same thing:

```sql
SELECT *
FROM customers, orders;
```

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

## Example: Cross Join Output

```sql
SELECT *
FROM customers
CROSS JOIN orders;
```

**Result**

| id  | first_name | last_name | email            | order_id | order_date | amount | customer_id |
| --- | ---------- | --------- | ---------------- | -------- | ---------- | ------ | ----------- |
| 5   | Bette      | Davis     | bette@aol.com    | 1        | 2016-02-10 | 99.99  | 1           |
| 4   | Blue       | Steele    | blue@gmail.com   | 1        | 2016-02-10 | 99.99  | 1           |
| 3   | David      | Bowie     | david@gmail.com  | 1        | 2016-02-10 | 99.99  | 1           |
| 2   | George     | Michael   | gm@gmail.com     | 1        | 2016-02-10 | 99.99  | 1           |
| 1   | Boy        | George    | george@gmail.com | 1        | 2016-02-10 | 99.99  | 1           |
| 5   | Bette      | Davis     | bette@aol.com    | 2        | 2017-11-11 | 35.50  | 1           |
| 4   | Blue       | Steele    | blue@gmail.com   | 2        | 2017-11-11 | 35.50  | 1           |
| 3   | David      | Bowie     | david@gmail.com  | 2        | 2017-11-11 | 35.50  | 1           |
| 2   | George     | Michael   | gm@gmail.com     | 2        | 2017-11-11 | 35.50  | 1           |
| 1   | Boy        | George    | george@gmail.com | 2        | 2017-11-11 | 35.50  | 1           |
| 5   | Bette      | Davis     | bette@aol.com    | 3        | 2014-12-12 | 800.67 | 2           |
| 4   | Blue       | Steele    | blue@gmail.com   | 3        | 2014-12-12 | 800.67 | 2           |
| 3   | David      | Bowie     | david@gmail.com  | 3        | 2014-12-12 | 800.67 | 2           |
| 2   | George     | Michael   | gm@gmail.com     | 3        | 2014-12-12 | 800.67 | 2           |
| 1   | Boy        | George    | george@gmail.com | 3        | 2014-12-12 | 800.67 | 2           |
| 5   | Bette      | Davis     | bette@aol.com    | 4        | 2015-01-03 | 12.50  | 2           |
| 4   | Blue       | Steele    | blue@gmail.com   | 4        | 2015-01-03 | 12.50  | 2           |
| 3   | David      | Bowie     | david@gmail.com  | 4        | 2015-01-03 | 12.50  | 2           |
| 2   | George     | Michael   | gm@gmail.com     | 4        | 2015-01-03 | 12.50  | 2           |
| 1   | Boy        | George    | george@gmail.com | 4        | 2015-01-03 | 12.50  | 2           |
| 5   | Bette      | Davis     | bette@aol.com    | 5        | 1999-04-11 | 459.25 | 5           |
| 4   | Blue       | Steele    | blue@gmail.com   | 5        | 1999-04-11 | 459.25 | 5           |
| 3   | David      | Bowie     | david@gmail.com  | 5        | 1999-04-11 | 459.25 | 5           |
| 2   | George     | Michael   | gm@gmail.com     | 5        | 1999-04-11 | 459.25 | 5           |
| 1   | Boy        | George    | george@gmail.com | 5        | 1999-04-11 | 459.25 | 5           |

---

## When to Use Cross Joins

- When you need **every combination of records from two tables**.
- Often used for generating combinations, pairing data, or testing.

**Note:**  
Without a `WHERE` clause to limit results, cross joins can get huge fast.
