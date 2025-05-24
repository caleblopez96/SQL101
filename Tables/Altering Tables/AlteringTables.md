# Altering Tables in SQL

This guide shows how to modify an existing table by adding a foreign key constraint to it. We'll walk through a simple example using an `orders` and `customers` table.

---

## Syntax:

```sql
ALTER TABLE table_name
ADD column_name data_type;
```

## Example Scenario

We already have two tables:

### Existing `customers` Table

```sql
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);
```

### Existing `orders` Table (Before Foreign Key)

```sql
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT
);
```

At this point, there’s no relationship between the `orders.customer_id` and `customers.id`.

---

## Adding a Foreign Key with `ALTER TABLE`

Now, we want to enforce a relationship between the two tables by adding a foreign key constraint.

### SQL Query:

```sql
ALTER TABLE orders
ADD CONSTRAINT fk_customer_id
FOREIGN KEY (customer_id) REFERENCES customers(id);
```

**Explanation:**

- `ALTER TABLE orders`: Specifies the table to alter.
- `ADD CONSTRAINT fk_customer_id`: Creates a named foreign key constraint.
- `FOREIGN KEY (customer_id) REFERENCES customers(id)`: Links `orders.customer_id` to `customers.id`.

---

## ✅ Resulting `orders` Table Structure

Now `orders.customer_id` must match an existing `customers.id` value, or the insert will fail. This maintains data integrity and enforces a **One-to-Many relationship**.

---

## 📓 Notes

- Ensure the `customer_id` column exists in `orders` before adding the constraint.
- The referenced column (`customers.id`) must be a `PRIMARY KEY` or `UNIQUE`.
