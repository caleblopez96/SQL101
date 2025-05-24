# Inserting Data into SQL Tables

Inserting data means adding new rows (records) to a table in a database.

---

## Basic Syntax

```sql
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
```

- Specify the table you want to add data to.
- List the columns where you want to insert values.
- Provide the corresponding values in the same order.

---

## Example: Insert into Customers Table

```sql
INSERT INTO customers (first_name, last_name, email)
VALUES ('Alice', 'Johnson', 'alice.johnson@example.com');
```

---

## Insert Multiple Rows at Once

```sql
INSERT INTO customers (first_name, last_name, email)
VALUES
  ('Bob', 'Smith', 'bob.smith@example.com'),
  ('Carol', 'Davis', 'carol.davis@example.com');
```

---

## Insert Data Without Specifying Columns

If you want to insert values into **all columns**, and in the exact order they were defined, you can skip the column list:

```sql
INSERT INTO customers
VALUES (5, 'David', 'Brown', 'david.brown@example.com');
```

_Note:_ This requires providing values for every column, including IDs or auto-increment fields.

---

## Inserting Data with Default or Auto-Increment Columns

For tables with **auto-increment** primary keys, you usually skip that column in your insert:

```sql
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2025-05-24', 120.50, 3);
```

The database automatically assigns the next available `order_id`.

---

## Best Practices

- Always specify columns explicitly to avoid errors if the table structure changes.
- Use transactions if inserting multiple rows to ensure data consistency.
- Validate and sanitize input data to prevent SQL injection and data errors.
