# Creating Tables

To create a new table, specify the table name, the column names, and their data types

## SYNTAX:

```sql
CREATE TABLE tablename (
  column_name data_type
  column_name data_type
);
```

## EXAMPLE:

```sql
CREATE TABLE cats (
  name VARCHAR(50),
  age INT
)
```

```sql
CREATE TABLE dogs (
	name varchar(50),
    breed varchar(50),
    age int
);
```

## CONFIRMATION:

```sql
SHOW TABLES;
```

_If you're using a GUI, you can drop down the tables folder in the database you are working in. The table(s) should appear there._
