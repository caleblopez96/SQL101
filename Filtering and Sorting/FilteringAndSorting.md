# SQL Filtering and Sorting Overview

Use WHERE, ORDER BY, and LIMIT clauses to filter and sort data in SQL.

## Filtering with WHERE

The WHERE clause filters rows based on specified conditions.

### Basic Syntax

```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```

### Common Operators

- `=` : Equals
- `<>` or `!=` : Not equal to
- `>` : Greater than
- `<` : Less than
- `>=` : Greater than or equal to
- `<=` : Less than or equal to
- `BETWEEN` : Within a range
- `IN` : Matches any value in a list
- `LIKE` : Pattern matching
- `IS NULL` / `IS NOT NULL` : Check for null values

### Example

```sql
SELECT *
FROM customers
WHERE city = 'Phoenix';
```

## Sorting with ORDER BY

The ORDER BY clause sorts the result set by one or more columns.

### Basic Syntax

```sql
SELECT column1, column2, ...
FROM table_name
ORDER BY column1 [ASC|DESC], column2 [ASC|DESC], ...;
```

- `ASC` : Ascending order (default)
- `DESC` : Descending order

### Example

```sql
SELECT *
FROM customers
ORDER BY last_name ASC;
```

## Limiting Results with LIMIT

The LIMIT clause restricts the number of rows returned.

### Basic Syntax (MySQL, PostgreSQL, SQLite)

```sql
SELECT column1, column2, ...
FROM table_name
LIMIT number;
```

### Example

```sql
SELECT *
FROM customers
LIMIT 5;
```

### SQL Server / MS Access Equivalent

```sql
SELECT TOP 5 *
FROM customers;
```

## Summary

- Use `WHERE` to filter records based on conditions
- Use `ORDER BY` to sort records by one or more columns
- Use `LIMIT` (or `TOP` in SQL Server) to restrict the number of rows returned

These clauses help control which data you retrieve and how it's displayed.
