CREATE DATABASE shop;

USE shop;

CREATE table customers(
	id INT PRIMARY KEY auto_increment,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50)
);

CREATE table orders(
	id INT PRIMARY KEY AUTO_INCREMENT,
	order_date DATE,
  amount decimal(8,2),
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);

