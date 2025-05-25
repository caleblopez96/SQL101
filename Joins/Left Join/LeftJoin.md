# LEFT JOIN

## What is a LEFT JOIN?

A **LEFT JOIN** returns **all records from the left table** (CUSTOMERS), and the matched records from the right table (ORDERS).  
If there is no match, the result will contain `NULL` for columns from the right table.

---

## How it works:

- Returns all rows from the left table.
- Matches rows from the right table when the join condition is true.
- For rows in the left table with no matching right table rows, the right table columns are filled with `NULL`.

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

## LEFT JOIN Query:

```sql
SELECT c.first_name, c.last_name, o.amount
FROM CUSTOMERS c
LEFT JOIN ORDERS o
ON c.id = o.customer_id;
```

## Result Table

| first_name | last_name | amount |
| ---------- | --------- | ------ |
| Boy        | George    | 99.99  |
| Boy        | George    | 35.50  |
| George     | Michael   | 800.67 |
| George     | Michael   | 12.50  |
| David      | Bowie     | NULL   |
| Blue       | Steele    | NULL   |

---

## Notes:

- David Bowie and Blue Steele appear in the results with `NULL` amounts because they have no matching orders.
- All rows from the `CUSTOMERS` table are included in the result.
- Rows from `ORDERS` without a matching customer would also appear with `NULL` in customer columns (if any existed).

---

## Summary:

- **LEFT JOIN** returns all rows from the left table.
- Matched rows from the right table are included.
- Non-matching rows from the right table are shown as `NULL`.
