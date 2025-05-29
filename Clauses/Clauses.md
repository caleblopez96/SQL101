# SQL Clauses

##

SELECT

FROM

WHERE

ORDER BY

GROUP BY

HAVING

JOIN (INNER, LEFT, RIGHT, FULL)

DISTINCT

LIMIT / TOP

---

## SELECT

**Explanation:**  
Retrieves specific columns or data from a table.

**Syntax:**

```sql
SELECT column1, column2
FROM table_name;
```

**Example:**

```sql
SELECT First_Name, Last_Name
FROM customers;
```

---

## FROM

**Explanation:**  
Specifies the table(s) to retrieve data from.

**Syntax:**

```sql
SELECT column1
FROM table_name;
```

**Example:**

```sql
SELECT Order_ID
FROM orders;
```

---

## WHERE

**Explanation:**  
Filters records based on a specified condition.

**Syntax:**

```sql
SELECT column1
FROM table_name
WHERE condition;
```

**Example:**

```sql
SELECT *
FROM customers
WHERE City = 'Phoenix';
```

---

## ORDER BY

**Explanation:**  
Sorts the result set in ascending or descending order.

**Syntax:**

```sql
SELECT column1
FROM table_name
ORDER BY column1 [ASC|DESC];
```

**Example:**

```sql
SELECT First_Name, Last_Name
FROM customers
ORDER BY Last_Name ASC;
```

---

## GROUP BY

**Explanation:**  
Groups rows that have the same values in specified columns.

**Syntax:**

```sql
SELECT column1, COUNT(*)
FROM table_name
GROUP BY column1;
```

**Example:**

```sql
SELECT City, COUNT(Customer_ID) AS Total_Customers
FROM customers
GROUP BY City;
```

---

## HAVING

**Explanation:**  
Filters groups created by `GROUP BY` based on a condition.

**Syntax:**

```sql
SELECT column1, COUNT(*)
FROM table_name
GROUP BY column1
HAVING COUNT(*) > number;
```

**Example:**

```sql
SELECT City, COUNT(Customer_ID) AS Total_Customers
FROM customers
GROUP BY City
HAVING COUNT(Customer_ID) > 5;
```

---

## JOIN

**Explanation:**  
Combines rows from two or more tables based on a related column.

**Types & Syntax:**

**INNER JOIN:**

```sql
SELECT columns
FROM table1
INNER JOIN table2 ON table1.column = table2.column;
```

**LEFT JOIN:**

```sql
SELECT columns
FROM table1
LEFT JOIN table2 ON table1.column = table2.column;
```

**RIGHT JOIN:**

```sql
SELECT columns
FROM table1
RIGHT JOIN table2 ON table1.column = table2.column;
```

**FULL JOIN:**

```sql
SELECT columns
FROM table1
FULL JOIN table2 ON table1.column = table2.column;
```

**Example (INNER JOIN):**

```sql
SELECT customers.First_Name, orders.Order_Date
FROM customers
INNER JOIN orders ON customers.Customer_ID = orders.Customer_ID;
```

---

## DISTINCT

**Explanation:**  
Returns only unique (distinct) values.

**Syntax:**

```sql
SELECT DISTINCT column1
FROM table_name;
```

**Example:**

```sql
SELECT DISTINCT City
FROM customers;
```

---

## LIMIT / TOP

**Explanation:**  
Limits the number of records returned by a query.

**Syntax (MySQL/PostgreSQL):**

```sql
SELECT column1
FROM table_name
LIMIT number;
```

**Syntax (SQL Server):**

```sql
SELECT TOP number column1
FROM table_name;
```

**Example (MySQL/PostgreSQL):**

```sql
SELECT *
FROM orders
LIMIT 5;
```

**Example (SQL Server):**

```sql
SELECT TOP 5 *
FROM orders;
```

---
