	create database office;
	use office;

	create table customer(
	customerId int primary key,
	firstName varchar(50),
	lastName varchar (50),
	email varchar(50),
	registerDate date
	);

	insert into customer (customerId, firstName, lastName, email, registerDate) VALUES
	(1, 'John', 'Doe', 'john.doe@email.com', '2022-03-15'),
	(2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02'),
	(3, 'Michael', 'Brown', 'michael.brown@email.com', '2022-06-20'),
	(4, 'Emily', 'Davis', 'emily.davis@email.com', '2023-01-10'),
	(5, 'Daniel', 'Wilson', 'daniel.wilson@email.com', '2021-08-05'),
	(6, 'Sophia', 'Taylor', 'sophia.taylor@email.com', '2022-12-18'),
	(7, 'William', 'Anderson', 'william.anderson@email.com', '2023-04-02');

	create table orders(
	orderID int primary key,
	customerID int,
	orderDate date,
	totalAmount int
	);

INSERT INTO orders (orderID, customerID, orderDate, totalAmount) VALUES
(101, 1, '2023-01-15', 450),
(102, 2, '2023-02-10', 800),
(103, 1, '2023-03-05', 1200),
(104, 3, '2023-04-20', 600),
(105, 4, '2023-05-12', 1500),
(106, 6, '2023-06-18', 300),
(107, 8, '2023-07-25', 900);


create table employees(
employeeID int primary key,
firstName varchar(50),
lastName varchar(50),
department varchar(50),
hireDate date,
salary int
);
    
INSERT INTO employees (employeeID, firstName, lastName, department, hireDate, salary) VALUES
(1, 'Amit', 'Sharma', 'IT', '2020-06-15', 80000),
(2, 'Neha', 'Patel', 'HR', '2019-03-10', 50000),
(3, 'Ravi', 'Kumar', 'Finance', '2018-11-25', 90000),
(4, 'Priya', 'Singh', 'Marketing', '2021-01-05', 45000),
(5, 'Arjun', 'Mehta', 'IT', '2017-09-18', 110000),
(6, 'Kiran', 'Rao', 'Operations', '2022-07-30', 40000),
(7, 'Sneha', 'Joshi', 'HR', '2020-12-12', 60000);

SELECT o.orderID, o.orderDate, o.totalAmount,
       c.firstName, c.lastName, c.email
FROM orders o
INNER JOIN customer c
ON o.customerID = c.customerId;

SELECT c.customerId, c.firstName, c.lastName,
       o.orderID, o.totalAmount
FROM customer c
LEFT JOIN orders o
ON c.customerId = o.customerID;

SELECT o.orderID, o.totalAmount,
       c.firstName, c.lastName
FROM customer c
RIGHT JOIN orders o
ON c.customerId = o.customerID;

SELECT c.customerId, c.firstName, o.orderID, o.totalAmount
FROM customer c
LEFT JOIN orders o ON c.customerId = o.customerID
UNION
SELECT c.customerId, c.firstName, o.orderID, o.totalAmount
FROM customer c
RIGHT JOIN orders o ON c.customerId = o.customerID;

SELECT DISTINCT c.customerId,c.firstName,c.lastName
FROM customer c
JOIN orders o ON c.customerId = o.customerID
where o.totalAmount > (
select avg(totalAmount) from orders
);

SELECT * FROM employees
where salary > (
select avg(salary) from employees
);

SELECT orderID,
       YEAR(orderDate) AS orderYear,
       MONTH(orderDate) AS orderMonth
FROM orders;

SELECT orderID,
       DATEDIFF(CURDATE(), orderDate) AS daysDifference
FROM orders;

SELECT orderID,
       DATE_FORMAT(orderDate, '%d-%b-%Y') AS formattedDate
FROM orders;

SELECT customerId,
       CONCAT(firstName, ' ', lastName) AS fullName
FROM customer;

SELECT customerId,
       REPLACE(firstName, 'John', 'Jonathan') AS updatedName
FROM customer;

SELECT customerId,
       UPPER(firstName) AS firstNameUpper,
       LOWER(lastName) AS lastNameLower
FROM customer;

SELECT customerId,
       TRIM(email) AS cleanedEmail
FROM customer;

SELECT orderID, orderDate, totalAmount,
       SUM(totalAmount) OVER (ORDER BY orderDate) AS runningTotal
FROM orders;

SELECT orderID, totalAmount,
       RANK() OVER (ORDER BY totalAmount DESC) AS orderRank
FROM orders;

SELECT orderID, totalAmount,
       CASE
           WHEN totalAmount > 1000 THEN '10% Discount'
           WHEN totalAmount > 500 THEN '5% Discount'
           ELSE 'No Discount'
       END AS discount
FROM orders;

SELECT employeeID, firstName, salary,
       CASE
           WHEN salary >= 90000 THEN 'High'
           WHEN salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS salaryCategory
FROM employees;
