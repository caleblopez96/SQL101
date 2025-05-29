# Dapper Cheat Sheet

Dapper is a lightweight ORM for .NET that maps SQL query results directly to C# objects.

---

## Setup

```bash
dotnet add package Dapper
```

```csharp
using Dapper;
using System.Data.SqlClient;
```

---

## Basic Query

```csharp
var sql = "SELECT * FROM Customers";
var customers = connection.Query<Customer>(sql).ToList();
```

## Query with Parameters

```csharp
var sql = "SELECT * FROM Customers WHERE CustomerId = @Id";
var customer = connection.QueryFirstOrDefault<Customer>(sql, new { Id = 1 });
```

## Insert Data

```csharp
var sql = "INSERT INTO Customers (FirstName, LastName) VALUES (@FirstName, @LastName)";
var rowsAffected = connection.Execute(sql, new { FirstName = "John", LastName = "Doe" });
```

## Update Data

```csharp
var sql = "UPDATE Customers SET FirstName = @FirstName WHERE CustomerId = @Id";
connection.Execute(sql, new { FirstName = "Johnny", Id = 1 });
```

## Delete Data

```csharp
var sql = "DELETE FROM Customers WHERE CustomerId = @Id";
connection.Execute(sql, new { Id = 1 });
```

## Join Query

```csharp
var sql = @"
    SELECT c.FirstName, c.LastName, o.Amount
    FROM Customers c
    INNER JOIN Orders o ON c.CustomerId = o.CustomerId";

var customerOrders = connection.Query<CustomerOrder>(sql).ToList();
```

## Aggregate Functions

```csharp
var sql = "SELECT COUNT(*) FROM Orders";
var orderCount = connection.ExecuteScalar<int>(sql);
```

## Execute Non-Query (INSERT, UPDATE, DELETE)

```csharp
var sql = "DELETE FROM Orders WHERE OrderId = @OrderId";
var rowsAffected = connection.Execute(sql, new { OrderId = 1 });
```

## Query Methods Overview

| Method          | Description                                                                                                       |
| :-------------- | :---------------------------------------------------------------------------------------------------------------- |
| `Query`         | Returns an enumerable of **dynamic types**. Useful for flexible, ad-hoc queries.                                  |
| `Query<T>`      | Returns an enumerable of the type specified by the `T` parameter. Maps query results directly to your C# objects. |
| `QueryAsync`    | Asynchronous version of `Query`. Returns a `Task<IEnumerable<dynamic>>`.                                          |
| `QueryAsync<T>` | Asynchronous version of `Query<T>`. Returns a `Task<IEnumerable<T>>`.                                             |

### Examples

**Query dynamic types:**

```csharp
var sql = "SELECT * FROM Customers";
var customers = connection.Query(sql);
```

**Query strongly-typed list:**

```csharp
var sql = "SELECT * FROM Customers";
var customers = connection.Query<Customer>(sql).ToList();
```

**Async query dynamic types:**

```csharp
var sql = "SELECT * FROM Orders";
var orders = await connection.QueryAsync(sql);
```

**Async query strongly-typed list:**

```csharp
var sql = "SELECT * FROM Orders";
var orders = await connection.QueryAsync<Order>(sql);
```

## Notes

- Use `Query<T>()` for SELECT queries
- Use `Execute()` for non-query commands (INSERT, UPDATE, DELETE)
- Always use parameters to prevent SQL injection
- Leverage multi-line `@""` strings for complex queries

---

### REFERENCE:

DOCS: https://www.learndapper.com/dapper-query/selecting-multiple-rows
