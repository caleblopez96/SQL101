# Foreign Keys (FK)

## What is a Foreign Key?

A **Foreign Key** is a column (or combination of columns) that **creates a relationship between two tables** by pointing to the **Primary Key** in another table.

## Rules:

- A Foreign Key can have **duplicate values** (unless explicitly restricted).
- A Foreign Key can be **NULL** (if the relationship is optional).
- A Foreign Key must **match a Primary Key value in the referenced table** or be NULL.
- Helps maintain **referential integrity** by ensuring valid relationships between tables.
- Can be used to enforce **ON DELETE** or **ON UPDATE** actions (like CASCADE or SET NULL).

## Example:

```sql
CREATE DATABASE shop;

USE shop;

CREATE TABLE customers (
  id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);

CREATE table orders(
	id INT PRIMARY KEY AUTO_INCREMENT,
	order_date DATE,
  amount decimal(8,2),
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);
```
