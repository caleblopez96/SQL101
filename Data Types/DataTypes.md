# SQL Supported Data Types

When you specify the data being used in your db, you also have to specify the data type that permitted in each column.

You need to specify the column name and it's type.

## EXAMPLE:

Syntax:

DATATYPE(SIZECONSTRAINT)

VARCHAR(100)

## Types:

### Numeric Types:

- INT: A whole number with a max signed value of 21474883647 (commonly used)
- SMALLINT:
- TINYINT
- MEDIUMINT
- BIGINT
- DECIMAL
- NUMERIC
- FLOAT
- DOUBLE
- BIT

### String Types:

- CHAR
- VARCHAR - Variable length string (commonly used)
- BINARY
- VARBINARY
- BLOB
- TINYBLOB
- MEDIUMBLOB
- LONGBLOB
- TEXT
- TINYTEXT
- MEDIUMTEXT
- LONGTEXT
- ENUM

### Date Types:

- DATE
- DATETIME
- TIMESTAMP
- TIME
- YEAR

## Example Table:

| Name   | Breed   | Age |
| ------ | ------- | --- |
| Blue   | Tabby   | 1   |
| Rocket | Mixed   | 3   |
| Monty  | Persian | 10  |

Name -> VARCHAR()

---

### REFERENCE:

Colt Steele:
https://www.udemy.com/course/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/learn/lecture/34412592#overview

MySQL: https://dev.mysql.com/doc/refman/8.4/en/data-types.html
