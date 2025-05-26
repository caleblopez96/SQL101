# 📚 Dapper Cheat Sheet

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

## Notes

- Use `Query<T>()` for SELECT queries
- Use `Execute()` for non-query commands (INSERT, UPDATE, DELETE)
- Always use parameters to prevent SQL injection
- Leverage multi-line `@""` strings for complex queries

---

Happy querying! 🚀
