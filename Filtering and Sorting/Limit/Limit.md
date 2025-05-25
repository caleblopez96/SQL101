# SQL LIMIT Clause Overview and Examples

The `LIMIT` clause is used to specify the maximum number of records to return in the result set.

---

## Basic Syntax (MySQL, PostgreSQL, SQLite)

```sql
SELECT column1, column2, ...
FROM table_name
LIMIT number;
```

---

## Example: Limiting to 5 Rows

```sql
SELECT *
FROM customers
LIMIT 5;
```

---

## Using LIMIT with OFFSET

You can skip a number of records before starting to return rows.

```sql
SELECT *
FROM customers
LIMIT 5 OFFSET 10;
```

This skips the first 10 rows and then returns the next 5.

---

## SQL Server / MS Access Equivalent

Instead of `LIMIT`, use `TOP`:

```sql
SELECT TOP 5 *
FROM customers;
```

For skipping rows, use `OFFSET FETCH` (SQL Server 2012+):

```sql
SELECT *
FROM customers
ORDER BY customer_id
OFFSET 10 ROWS FETCH NEXT 5 ROWS ONLY;
```

---

## Notes

- Always use `ORDER BY` with `LIMIT` if you want predictable results.
- Without `ORDER BY`, the rows returned by `LIMIT` may be arbitrary.

---
