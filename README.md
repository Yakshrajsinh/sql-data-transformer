# Office Database – SQL Practice Project

This repository contains a **complete SQL practice setup** using MySQL. It is designed for **learning and practicing SQL concepts** such as joins, subqueries, date functions, string functions, window functions, and conditional logic.

---

## 📌 Database Overview

**Database Name:** `office`

The database consists of three tables:

1. `customer`
2. `orders`
3. `employees`

These tables are populated with sample data to demonstrate real-world SQL queries.

---

## 📂 Table Structures

### 1️⃣ Customer Table

```sql
CREATE TABLE customer (
    customerId INT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(50),
    registerDate DATE
);
```

### 2️⃣ Orders Table

```sql
CREATE TABLE orders (
    orderID INT PRIMARY KEY,
    customerID INT,
    orderDate DATE,
    totalAmount INT
);
```

### 3️⃣ Employees Table

```sql
CREATE TABLE employees (
    employeeID INT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    department VARCHAR(50),
    hireDate DATE,
    salary INT
);
```

---

## 📥 Sample Data Insertion

### Customer Data

```sql
INSERT INTO customer VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2022-03-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02'),
(3, 'Michael', 'Brown', 'michael.brown@email.com', '2022-06-20'),
(4, 'Emily', 'Davis', 'emily.davis@email.com', '2023-01-10'),
(5, 'Daniel', 'Wilson', 'daniel.wilson@email.com', '2021-08-05'),
(6, 'Sophia', 'Taylor', 'sophia.taylor@email.com', '2022-12-18'),
(7, 'William', 'Anderson', 'william.anderson@email.com', '2023-04-02');
```

### Orders Data

```sql
INSERT INTO orders VALUES
(101, 1, '2023-01-15', 450),
(102, 2, '2023-02-10', 800),
(103, 1, '2023-03-05', 1200),
(104, 3, '2023-04-20', 600),
(105, 4, '2023-05-12', 1500),
(106, 6, '2023-06-18', 300),
(107, 8, '2023-07-25', 900);
```

### Employees Data

```sql
INSERT INTO employees VALUES
(1, 'Amit', 'Sharma', 'IT', '2020-06-15', 80000),
(2, 'Neha', 'Patel', 'HR', '2019-03-10', 50000),
(3, 'Ravi', 'Kumar', 'Finance', '2018-11-25', 90000),
(4, 'Priya', 'Singh', 'Marketing', '2021-01-05', 45000),
(5, 'Arjun', 'Mehta', 'IT', '2017-09-18', 110000),
(6, 'Kiran', 'Rao', 'Operations', '2022-07-30', 40000),
(7, 'Sneha', 'Joshi', 'HR', '2020-12-12', 60000);
```

---

## 🔍 SQL Concepts Covered

### ✅ Joins

* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* FULL OUTER JOIN (using UNION)

### ✅ Subqueries

* Customers with above-average order values
* Employees with above-average salaries

### ✅ Date Functions

* YEAR(), MONTH()
* DATEDIFF()
* DATE_FORMAT()

### ✅ String Functions

* CONCAT()
* REPLACE()
* UPPER(), LOWER()
* TRIM()

### ✅ Window Functions (MySQL 8+)

* Running total using `SUM() OVER()`
* Ranking using `RANK()`

### ✅ Conditional Logic

* CASE statements for discounts
* Salary categorization

---

## 📊 Example Queries

### INNER JOIN Example

```sql
SELECT o.orderID, o.totalAmount, c.firstName, c.lastName
FROM orders o
INNER JOIN customer c
ON o.customerID = c.customerId;
```

### Running Total Example

```sql
SELECT orderID, orderDate, totalAmount,
       SUM(totalAmount) OVER (ORDER BY orderDate) AS runningTotal
FROM orders;
```

### Salary Categorization Example

```sql
SELECT employeeID, firstName, salary,
       CASE
           WHEN salary >= 90000 THEN 'High'
           WHEN salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS salaryCategory
FROM employees;
```

---

## 🎯 Purpose of This Project

* SQL exam and viva preparation
* Interview practice
* Hands-on understanding of joins and subqueries
* Learning analytical SQL functions

---

## 🛠 Requirements

* MySQL 8.0 or higher
* Any SQL client (MySQL Workbench, DBeaver, phpMyAdmin)

---

## 📌 How to Use

1. Create the database and tables
2. Insert the sample data
3. Run the queries section by section
4. Observe and analyze the outputs

---

## 📄 License

This project is for **educational purposes only**.

---

**Author:** SQL Practice Project
