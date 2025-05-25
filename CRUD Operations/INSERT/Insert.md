# SQL INSERT Statement Overview and Examples

The `INSERT` statement is used to add new rows of data to a table in a database.

---

## Basic Syntax

```sql
INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...);
```

To insert into all columns:

```sql
INSERT INTO table_name
VALUES (value1, value2, value3, ...);
```

---

## Inserting Specific Columns

You can specify which columns to insert data into:

```sql
INSERT INTO customers (first_name, last_name, email)
VALUES ('John', 'Doe', 'john.doe@email.com');
```

---

## Inserting Multiple Rows

To insert multiple rows in a single statement:

```sql
INSERT INTO customers (first_name, last_name, city)
VALUES
  ('Alice', 'Smith', 'Phoenix'),
  ('Bob', 'Johnson', 'Denver'),
  ('Carol', 'Williams', 'Seattle');
```

---

## Using Default Values

To use default values for certain columns:

```sql
INSERT INTO orders (customer_id, amount)
VALUES (1, 150.00);
```

---

## Inserting with Conditions

Using subqueries to insert based on conditions:

```sql
INSERT INTO customers (first_name, last_name, email)
SELECT first_name, last_name, email
FROM prospects
WHERE status = 'approved';
```

---

## Combining with Functions

```sql
INSERT INTO orders (customer_id, amount, order_date)
VALUES (1, 100.00, CURRENT_DATE);
```

---

## Handling Duplicates

MySQL supports ON DUPLICATE KEY UPDATE:

```sql
INSERT INTO customers (id, first_name, last_name)
VALUES (1, 'John', 'Smith')
ON DUPLICATE KEY UPDATE last_name = 'Smith';
```

PostgreSQL supports ON CONFLICT:

```sql
INSERT INTO customers (id, first_name, last_name)
VALUES (1, 'John', 'Smith')
ON CONFLICT (id) DO UPDATE SET last_name = 'Smith';
```

---

## Copying Data (Preview)

```sql
INSERT INTO customers_backup (first_name, last_name, email)
SELECT first_name, last_name, email
FROM customers;
```

---

This file covers the basics of INSERT statements with common clauses.
