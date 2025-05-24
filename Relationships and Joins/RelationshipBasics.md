# Relationships and Joins

There are three primary relationships

- One to One Relationship
- One to Many Relationship (Most Common)
- Many to Many Relationship

## One to One

## One to Many (1:Many)

### Example:

One customer can have many orders, but one order is associated with only one customer.

Lets say we want to store:

- A customers first and last name (VARCHAR(100))
- A customers email (VARCHAR(100))
- The date of the purchase (DATETIME)
- The price of the order (DECIMAL)

#### You could model it like this with one table:

| first_name | last_name | email            | order_date   | amount |
| ---------- | --------- | ---------------- | ------------ | ------ |
| Boy        | George    | george@gmail.com | '2016/02/10' | 99.99  |
| Boy        | George    | george@gmail.com | '2017/11/11' | 35.50  |
| George     | Michael   | gm@gmail.com     | '2014/12/12' | 800.67 |
| George     | Michael   | gm@gmail.com     | '2015/01/03' | 12.50  |
| David      | Bowie     | david@gmail.com  | NULL         | NULL   |
| Blue       | Steele    | blue@gmail.com   | NULL         | NULL   |

The above works, but data is duplicated in multiple occassions.

For example, Boy George and George Michael have 2 orders.

Additionally, David Bowie hasn't even placed an order yet but he's still showing up in the orders table.

#### The better way to model it is like this:

Customers

- first_name
- last_name
- email
- customer_id

Orders

- order_id
- order_date
- amount
- customer_id

This associates the Customers with the Orders by using the customer_id when an order is placed.

##### CUSTOMERS

| customer_id | first_name | last_name | email            |
| ----------- | ---------- | --------- | ---------------- |
| 1           | Boy        | George    | george@gmail.com |
| 2           | George     | Michael   | gm@gmail.com     |
| 3           | David      | Bowie     | david@gmail.com  |
| 4           | Blue       | Steele    | blue@gmail.com   |

PK = customer_id

##### ORDERS

| order_id | order_date   | amount | customer_id |
| -------- | ------------ | ------ | ----------- |
| 1        | '2016/02/10' | 99.99  | 1           |
| 2        | '2017/11/17' | 35.50  | 1           |
| 3        | '2014/12/12' | 800.67 | 2           |
| 4        | '2015/01/03' | 12.50  | 2           |

PK = order_id

FK = customer_id

## Many to Many

Books can have many authors and an Authors can author many books.
