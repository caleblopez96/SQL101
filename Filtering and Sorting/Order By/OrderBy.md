# SQL ORDER BY Clause Overview and Examples

The `ORDER BY` clause is used to sort the result set of a query by one or more columns.

---

## Basic Syntax

```sql
SELECT column1, column2, ...
FROM table_name
ORDER BY column1 [ASC|DESC], column2 [ASC|DESC], ...;
```

- `ASC` : Ascending order (default)
- `DESC` : Descending order

---

## Sorting a Single Column

```sql
SELECT *
FROM customers
ORDER BY last_name ASC;
```

---

## Sorting Multiple Columns

You can sort by multiple columns by separating them with commas. The result is sorted by the first column, then by the second if there are ties.

```sql
SELECT *
FROM customers
ORDER BY city ASC, last_name DESC;
```

---

## Sorting by a Column Not in the SELECT List

You can sort by a column even if it’s not part of the selected columns.

```sql
SELECT first_name, last_name
FROM customers
ORDER BY join_date DESC;
```

---

## Notes

- Sorting affects the order of rows returned, not the underlying data in the table.
- If no order is specified, most databases will return records in an arbitrary order.
- Use `ORDER BY` before `LIMIT` if both are present in a query.

---
