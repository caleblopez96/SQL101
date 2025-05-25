# Template SQL Queries

---

## Basic SELECT Queries

```sql
SELECT * FROM <table_name>;
```

```sql
SELECT <column1>, <column2> FROM <table_name>;
```

---

## Filtering Data with WHERE

```sql
SELECT * FROM <table_name>
WHERE <column_name> = '<value>';
```

```sql
SELECT * FROM <table_name>
WHERE <column_name> BETWEEN <value1> AND <value2>;
```

```sql
SELECT * FROM <table_name>
WHERE <column_name> IN ('<value1>', '<value2>', '<value3>');
```

```sql
SELECT * FROM <table_name>
WHERE <column_name> LIKE '%<pattern>%';
```

---

## Sorting Data

```sql
SELECT * FROM <table_name>
ORDER BY <column_name> ASC;
```

```sql
SELECT * FROM <table_name>
ORDER BY <column_name> DESC;
```

---

## Limiting Results

```sql
SELECT * FROM <table_name>
LIMIT <number>;
```

---

## Inserting Data

```sql
INSERT INTO <table_name> (<column1>, <column2>, <column3>)
VALUES ('<value1>', '<value2>', '<value3>');
```

---

## Updating Data

```sql
UPDATE <table_name>
SET <column1> = '<new_value>'
WHERE <column_name> = '<value>';
```

---

## Deleting Data

```sql
DELETE FROM <table_name>
WHERE <column_name> = '<value>';
```

---

## Aggregate Functions

```sql
SELECT COUNT(*) FROM <table_name>;
```

```sql
SELECT SUM(<column_name>) FROM <table_name>;
```

```sql
SELECT AVG(<column_name>) FROM <table_name>;
```

```sql
SELECT MIN(<column_name>) FROM <table_name>;
```

```sql
SELECT MAX(<column_name>) FROM <table_name>;
```

---

## Joining Tables (Preview)

```sql
SELECT a.<column>, b.<column>
FROM <table_a> a
INNER JOIN <table_b> b ON a.<foreign_key> = b.<primary_key>;
```

---
