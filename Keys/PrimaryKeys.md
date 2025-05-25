# Primary Keys (PK)

## What is a Primary Key?

A **Primary Key** is a column (or combination of columns) that **uniquely identifies each record** in a table.

## Rules:

- Every table **should have one Primary Key**.
- A Primary Key **must contain unique values**.
- A Primary Key **cannot contain NULL values**.
- Can be created on **one column** or a **combination of multiple columns** (called a composite key).
- Often used as the target for Foreign Keys in other tables.

## 📌 Example:

```sql
-- customer_id is the Primary Key that uniquely identifies each row in the customers table.

CREATE TABLE customers (
  id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);
```
