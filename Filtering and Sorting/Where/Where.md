# SQL WHERE Clause Overview and Examples

The `WHERE` clause is used to filter records returned by a `SELECT`, `UPDATE`, or `DELETE` statement based on specific conditions.

---

## Basic Syntax

```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```

---

## Filtering with a Single Condition

```sql
SELECT *
FROM customers
WHERE city = 'Phoenix';
```

---

## Using Comparison Operators

Common operators:

- `=` : Equal to
- `<>` : Not equal to
- `>` : Greater than
- `<` : Less than
- `>=` : Greater than or equal to
- `<=` : Less than or equal to

Example:

```sql
SELECT *
FROM orders
WHERE amount > 100;
```

---

## Using BETWEEN

Filters values within a range (inclusive):

```sql
SELECT *
FROM orders
WHERE amount BETWEEN 50 AND 150;
```

---

## Using IN

Checks for values in a given list:

```sql
SELECT *
FROM customers
WHERE city IN ('Phoenix', 'Tempe', 'Mesa');
```

---

## Using LIKE

Searches for a specified pattern:

- `%` : Any sequence of characters
- `_` : Single character

Example:

```sql
SELECT *
FROM customers
WHERE last_name LIKE 'S%';
```

---

## Using IS NULL

Checks for null (missing) values:

```sql
SELECT *
FROM customers
WHERE phone_number IS NULL;
```

---

## Combining Conditions with AND, OR

```sql
SELECT *
FROM customers
WHERE city = 'Phoenix' AND membership_status = 'Active';
```

```sql
SELECT *
FROM customers
WHERE city = 'Phoenix' OR city = 'Tempe';
```

---

## Notes

- Use parentheses `()` to control the order of conditions when combining multiple.
- `WHERE` can be used in `SELECT`, `UPDATE`, and `DELETE` statements.
- Be careful with null values — comparisons like `= NULL` won't work; use `IS NULL` instead.

---
