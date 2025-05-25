# Relationships and Joins

In relational databases, understanding how tables relate to each other is crucial. There are three primary types of relationships between tables:

- One-to-One Relationship
- One-to-Many Relationship (Most Common)
- Many-to-Many Relationship

---

## One-to-One Relationship

This is when one row in a table corresponds to exactly one row in another table.  
Example: Each user has one unique profile.

---

## One-to-Many Relationship (1:N)

This is the most common relationship type. One record in the **parent** table relates to multiple records in the **child** table.  
Example: One customer can place many orders, but each order belongs to only one customer.

---

### Example: Customers and Orders

We want to store:

- Customer's first and last name (VARCHAR(100))
- Customer's email (VARCHAR(100))
- Order date (DATETIME)
- Order amount (DECIMAL)

---

### Modeling with a Single Table (Bad Practice)

| first_name | last_name | email            | order_date | amount |
| ---------- | --------- | ---------------- | ---------- | ------ |
| Boy        | George    | george@gmail.com | 2016-02-10 | 99.99  |
| Boy        | George    | george@gmail.com | 2017-11-11 | 35.50  |
| George     | Michael   | gm@gmail.com     | 2014-12-12 | 800.67 |
| George     | Michael   | gm@gmail.com     | 2015-01-03 | 12.50  |
| David      | Bowie     | david@gmail.com  | NULL       | NULL   |
| Blue       | Steele    | blue@gmail.com   | NULL       | NULL   |

**Issues:**

- Data duplication: Customer details repeat for every order.
- Nulls: Customers without orders have NULL values for order fields.
- Difficult to maintain and scale.

---

### Better Modeling: Separate Tables with Relationships

**Customers Table:**

| id  | first_name | last_name | email            |
| --- | ---------- | --------- | ---------------- |
| 1   | Boy        | George    | george@gmail.com |
| 2   | George     | Michael   | gm@gmail.com     |
| 3   | David      | Bowie     | david@gmail.com  |
| 4   | Blue       | Steele    | blue@gmail.com   |

Primary Key: `customer_id`

**Orders Table:**

| order_id | order_date | amount | customer_id |
| -------- | ---------- | ------ | ----------- |
| 1        | 2016-02-10 | 99.99  | 1           |
| 2        | 2017-11-17 | 35.50  | 1           |
| 3        | 2014-12-12 | 800.67 | 2           |
| 4        | 2015-01-03 | 12.50  | 2           |

Primary Key: `order_id`

Foreign Key: `customer_id` references `customers.id`

---

### How This Helps:

- Customer data is stored once and referenced by many orders.
- Avoids duplication and inconsistent data.
- Easier to maintain and scale.

---

## Many-to-Many Relationship

Many records in one table relate to many records in another table.

### Example: Books and Authors

- A book can have multiple authors.
- An author can write multiple books.

This requires a **junction table** (also called a join table or associative table) to manage relationships.

---

### Example Tables for Many-to-Many

**Books Table:**

| book_id | title             |
| ------- | ----------------- |
| 1       | "Database Basics" |
| 2       | "Advanced SQL"    |

**Authors Table:**

| author_id | name         |
| --------- | ------------ |
| 1         | "Jane Smith" |
| 2         | "John Doe"   |

**Books_Authors (junction table):**

| book_id | author_id |
| ------- | --------- |
| 1       | 1         |
| 1       | 2         |
| 2       | 2         |

---

### Summary

| Relationship Type | Description                          | Example                                |
| ----------------- | ------------------------------------ | -------------------------------------- |
| One-to-One        | One record corresponds to one record | User and Profile                       |
| One-to-Many       | One record relates to many records   | Customer and Orders                    |
| Many-to-Many      | Many records relate to many records  | Books and Authors (via junction table) |

---

Understanding these relationships helps design efficient and normalized databases, which avoid data duplication, maintain data integrity, and improve query performance.
