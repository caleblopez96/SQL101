# USE a specific database

MySQL wont know what database you are trying to run queries on unless you run the following query:

## Query:

```sql
USE <databaseName>;
```

Replace < databaseName > with the name of the database that you would like to run queries on.

## EXAMPLE:

```sql
USE dog_walking_app;
```

## To confirm that you're working on the correct database, you can run the following query:

```sql
SELECT database();
```

## Result:

```cmd
+-----------------+
| database()      |
+-----------------+
| dog_walking_app |
+-----------------+
```

_If you're using a GUI to work with SQL such as MySQL or MySQL workbench, you can just double click on the database you want to use and it should put you inside of it. Remeber to run the following query if you need to check what database you are currently working in_

```sql
SELECT database();
```

---

### REFERENCE:

Colt Steele: https://www.udemy.com/course/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/learn/lecture/34412588#overview
