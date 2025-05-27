# Basic CRUD Operations in SQL

CRUD stands for **Create, Read, Update, Delete** — the four essential operations you can perform on data in a database.

In SQL, the acronym is ISUD which stands for **Insert, Select Update Delete**.

C --> Insert

R --> Select

U --> Update

D --> Delete

These operations allow you to manage the records in your tables.

---

## INSERT (Create)

- Adds new records (rows) to a table.
- You must specify the values for each column you're adding.

### Syntax:

```sql
INSERT INTO tableName(column1_name, column2_name, column3_name)
VALUES('valueCol1', 'valueCol2', 'valueCol3');
```

### Example

```sql
INSERT INTO customers(first_name, last_name, email)
VALUES('John', 'Doe', 'john.doe@email.com');
```

## SELECT (Read)

- Retrieves data from a database.
- You can fetch specific columns or all columns.
- Can include filtering, sorting, and grouping.

### Syntax:

```sql
SELECT column1_name, column2_name
FROM tableName
WHERE condition = 'value'
ORDER BY column1_name;
```

### Example:

```sql
SELECT first_name, last_name, email
FROM customers
WHERE last_name = 'Doe'
ORDER BY first_name;
```

## UPDATE (Update)

- Modifies existing records in a table.
- You can update one or multiple rows.
- Typically paired with a `WHERE` clause to limit which rows get updated.

### Syntax:

```sql
UPDATE tableName
SET column1_name = 'newValue1', column2_name = 'newValue2'
WHERE condition = 'value';
```

### Example:

```sql
UPDATE customers
SET email = 'john.smith@email.com', last_name = 'Smith'
WHERE customer_id = 1;
```

## DELETE (Delete)

- Removes records from a table.
- Like UPDATE, it's wise to use a `WHERE` clause, or you might delete everything.

### Syntax:

```sql
DELETE FROM tableName
WHERE condition = 'value';
```

### Example:

```sql
DELETE FROM customers
WHERE customer_id = 1;
```

---
