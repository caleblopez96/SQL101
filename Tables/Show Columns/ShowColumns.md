# Show Columns

To show the columns in your database run the following query:

## Query:

```sql
SHOW COLUMNS FROM <tableName>;
```

Replace < tableName > with the name of the table you want to show the columns.

### OR

```sql
DESC cats;
```

## Result:

```cmd
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| name  | varchar(50) | YES  |     | NULL    |       |
| breed | varchar(50) | YES  |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
```
