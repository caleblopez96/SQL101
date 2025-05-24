# Keys

## Primary Key vs Foreign Key

### Primary Key:

- A **primary key** is a **unique identifier for each record in a table**.
- It **must be unique** and **cannot be null**.
- Each table typically has **one primary key**.

### Example:

#### CUSTOMERS TABLE

| customer_id (PK) | first_name | last_name | email            |
| ---------------- | ---------- | --------- | ---------------- |
| 1                | Boy        | George    | george@gmail.com |
| 2                | George     | Michael   | gm@gmail.com     |
| 3                | David      | Bowie     | david@gmail.com  |
| 4                | Blue       | Steele    | blue@gmail.com   |

##### PK = customer_id

---

### Foreign Key:

- A **foreign key** is a column (or group of columns) in one table that **refers to the primary key in another table**.
- It’s used to **link records between tables**.
- The foreign key value **doesn't have to be unique** in the table it’s in — multiple records can share the same foreign key value.

### Example:

#### ORDERS TABLE

| order_id (PK) | order_date   | amount | customer_id (FK) |
| ------------- | ------------ | ------ | ---------------- |
| 1             | '2016/02/10' | 99.99  | 1                |
| 2             | '2017/11/17' | 35.50  | 1                |
| 3             | '2014/12/12' | 800.67 | 2                |
| 4             | '2015/01/03' | 12.50  | 2                |

##### PK = order_id

##### FK = customer_id

---

### TLDR:

- **Primary Key** = Unique identifier in its own table.
- **Foreign Key** = Reference to another table’s primary key to build relationships.
