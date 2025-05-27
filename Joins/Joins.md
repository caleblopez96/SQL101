# SQL JOINs

In relational databases, JOIN operations combine rows from two or more tables based on related columns. They allow you to query related data efficiently.

When referencing positional joins like left join and right join:

**Left** = the table written before the `JOIN` keyword  
**Right** = the table written after the `JOIN` keyword

## Sample Tables

**Customers Table:**

| id  | first_name | last_name | email            |
| --- | ---------- | --------- | ---------------- |
| 1   | Boy        | George    | george@gmail.com |
| 2   | George     | Michael   | gm@gmail.com     |
| 3   | David      | Bowie     | david@gmail.com  |
| 4   | Blue       | Steele    | blue@gmail.com   |

Primary Key: `id`

**Orders Table:**

| order_id | order_date | amount | customer_id |
| -------- | ---------- | ------ | ----------- |
| 1        | 2016-02-10 | 99.99  | 1           |
| 2        | 2017-11-17 | 35.50  | 1           |
| 3        | 2014-12-12 | 800.67 | 2           |
| 4        | 2015-01-03 | 12.50  | 2           |

Primary Key: `order_id`  
Foreign Key: `customer_id` references `customers.id`

## Common Types of JOINs with Examples

### 1. INNER JOIN

**Syntax:**

```sql
SELECT columns
FROM table1
INNER JOIN table2 ON table1.column = table2.column;
```

**Example:**

```sql
SELECT c.first_name, c.last_name, o.order_date, o.amount
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
ORDER BY o.amount DESC;
```

| first_name | last_name | order_date | amount |
| ---------- | --------- | ---------- | ------ |
| George     | Michael   | 2014-12-12 | 800.67 |
| Bette      | Davis     | 1999-04-11 | 459.25 |
| Boy        | George    | 2016-02-10 | 99.99  |
| Boy        | George    | 2017-11-11 | 35.50  |
| George     | Michael   | 2015-01-03 | 12.50  |

Only shows customers with orders and orders with valid customers.

---

### 2. LEFT JOIN (or LEFT OUTER JOIN)

**Syntax:**

```sql
SELECT columns
FROM table1
LEFT JOIN table2 ON table1.column = table2.column;
```

**Example:**

```sql
SELECT c.first_name, c.last_name, o.order_date, o.amount
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id;
```

**Result:**
| first_name | last_name | order_date | amount |
|------------|------------|------------|--------|
| Boy | George | 2017-11-11 | 35.50 |
| Boy | George | 2016-02-10 | 99.99 |
| George | Michael | 2015-01-03 | 12.50 |
| George | Michael | 2014-12-12 | 800.67 |
| David | Bowie | NULL | NULL |
| Blue | Steele | NULL | NULL |
| Bette | Davis | 1999-04-11 | 459.25 |

Shows all customers, with `NULL`s for those without orders.

---

### 3. RIGHT JOIN (or RIGHT OUTER JOIN)

**Syntax:**

```sql
SELECT columns
FROM table1
RIGHT JOIN table2 ON table1.column = table2.column;
```

**Example:**

```sql
SELECT c.first_name, c.last_name, o.order_date, o.amount
FROM customers c
RIGHT JOIN orders o ON c.id = o.customer_id;
```

**Result:**

| first_name | last_name | order_date | amount |
| ---------- | --------- | ---------- | ------ |
| Boy        | George    | 2016-02-10 | 99.99  |
| Boy        | George    | 2017-11-11 | 35.50  |
| George     | Michael   | 2014-12-12 | 800.67 |
| George     | Michael   | 2015-01-03 | 12.50  |
| Bette      | Davis     | 1999-04-11 | 459.25 |

Same as INNER JOIN in this case since all orders have valid customers.

---

### 4. FULL JOIN (or FULL OUTER JOIN)

**Syntax:**

```sql
SELECT columns
FROM table1
FULL JOIN table2 ON table1.column = table2.column;
```

**Example:**

```sql
SELECT c.first_name, c.last_name, o.order_date, o.amount
FROM customers c
FULL JOIN orders o ON c.id = o.customer_id;
```

**Result:**

| first_name | last_name | order_date | amount |
| ---------- | --------- | ---------- | ------ |
| Boy        | George    | 2016-02-10 | 99.99  |
| Boy        | George    | 2017-11-17 | 35.50  |
| George     | Michael   | 2014-12-12 | 800.67 |
| George     | Michael   | 2015-01-03 | 12.50  |
| David      | Bowie     | NULL       | NULL   |
| Blue       | Steele    | NULL       | NULL   |

Same as LEFT JOIN in this case since there are no orders without customers.

---

### 5. CROSS JOIN

**Syntax:**

```sql
SELECT columns
FROM table1
CROSS JOIN table2;
```

**Example:**

```sql
SELECT c.first_name, o.order_date
FROM customers c
CROSS JOIN orders o;
```

**Result**
| Name | Date |
|--------|------------|
| Bette | 2016-02-10 |
| Blue | 2016-02-10 |
| David | 2016-02-10 |
| George | 2016-02-10 |
| Boy | 2016-02-10 |
| Bette | 2017-11-11 |
| Blue | 2017-11-11 |
| David | 2017-11-11 |
| George | 2017-11-11 |
| Boy | 2017-11-11 |
| Bette | 2014-12-12 |
| Blue | 2014-12-12 |
| David | 2014-12-12 |
| George | 2014-12-12 |
| Boy | 2014-12-12 |
| Bette | 2015-01-03 |
| Blue | 2015-01-03 |
| David | 2015-01-03 |
| George | 2015-01-03 |
| Boy | 2015-01-03 |
| Bette | 1999-04-11 |
| Blue | 1999-04-11 |
| David | 1999-04-11 |
| George | 1999-04-11 |
| Boy | 1999-04-11 |

---

### 6. SELF JOIN

**Syntax:**

```sql
SELECT a.columns, b.columns
FROM table a
JOIN table b ON a.column = b.column;
```

**Example (assuming we add a `referred_by` column to customers):**

```sql
SELECT a.first_name, a.last_name, b.first_name AS referred_by
FROM customers a
LEFT JOIN customers b ON a.referred_by = b.id;
```

---

## Key Points

- JOINs rely on keys (often primary and foreign keys) to relate tables.
- Choosing the correct JOIN type depends on the data relationship and desired output.
- JOIN performance can be impacted by indexing and table size.
- Understanding JOINs is fundamental to working with relational databases effectively.
- Always specify the JOIN condition explicitly (don't use implicit joins).
