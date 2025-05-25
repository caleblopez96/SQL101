SELECT c.first_name, c.last_name, o.amount, o.order_date
FROM CUSTOMERS c
INNER JOIN ORDERS o
ON c.id = o.customer_id;