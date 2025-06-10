CREATE DATABASE homework_15
GO
USE homework_15

--1

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);
GO
SELECT * FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees)

--2

CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO products (id, product_name, price) VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 400),
(3, 'Smartphone', 800),
(4, 'Monitor', 300);
GO
SELECT * FROM products
WHERE price > (SELECT AVG(price) FROM products)

--3

CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (id, department_name) VALUES
(1, 'Sales'),
(2, 'HR');

INSERT INTO employees (id, name, department_id) VALUES
(1, 'David', 1),
(2, 'Eve', 2),
(3, 'Frank', 1);
GO
SELECT dep.id, dep.department_name, emp1.name FROM departments AS dep
LEFT JOIN employees AS emp1
  ON dep.id = emp1.department_id
WHERE dep.department_name = 'Sales'

--4

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, name) VALUES
(1, 'Grace'),
(2, 'Heidi'),
(3, 'Ivan');

INSERT INTO orders (order_id, customer_id) VALUES
(1, 1),
(2, 1);
GO
-- (1-usul)
SELECT cus.customer_id, cus.name FROM customers AS cus
LEFT JOIN orders AS ord 
  ON cus.customer_id = ord.customer_id
WHERE ord.customer_id IS NULL
--(2-usul)
SELECT * FROM customers
WHERE customer_id NOT IN(
    SELECT customer_id FROM orders
)

--5

CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO products (id, product_name, price, category_id) VALUES
(1, 'Tablet', 400, 1),
(2, 'Laptop', 1500, 1),
(3, 'Headphones', 200, 2),
(4, 'Speakers', 300, 2);
GO
SELECT p1.product_name, p1.price, p1.category_id
FROM products AS p1
WHERE price = (
   SELECT MAX(price)
   FROM products AS p2
   WHERE p1.category_id = p2.category_id
)

--6

CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (id, department_name) VALUES
(1, 'IT'),
(2, 'Sales');

INSERT INTO employees (id, name, salary, department_id) VALUES
(1, 'Jack', 80000, 1),
(2, 'Karen', 70000, 1),
(3, 'Leo', 60000, 2);
GO 
SELECT * 
FROM employees
WHERE department_id =
   (SELECT TOP 1 department_id
   FROM employees
   GROUP BY department_id
   ORDER BY AVG(salary) DESC
)

--7

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employees (id, name, salary, department_id) VALUES
(1, 'Mike', 50000, 1),
(2, 'Nina', 75000, 1),
(3, 'Olivia', 40000, 2),
(4, 'Paul', 55000, 2);
GO
SELECT *
FROM employees AS emp1
WHERE salary > 
   (SELECT AVG(salary)
   FROM employees1
   WHERE department_id = emp1.department_id
)


--8

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE grades (
    student_id INT,
    course_id INT,
    grade DECIMAL(4, 2),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO students (student_id, name) VALUES
(1, 'Sarah'),
(2, 'Tom'),
(3, 'Uma');

INSERT INTO grades (student_id, course_id, grade) VALUES
(1, 101, 95),
(2, 101, 85),
(3, 102, 90),
(1, 102, 80);
GO
SELECT *
FROM grades AS g
   WHERE g.grade >
      (SELECT AVG(grade)
	  FROM grades
	  WHERE course_id = g.course_id 
)

--9

CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO products (id, product_name, price, category_id) VALUES
(1, 'Phone', 800, 1),
(2, 'Laptop', 1500, 1),
(3, 'Tablet', 600, 1),
(4, 'Smartwatch', 300, 1),
(5, 'Headphones', 200, 2),
(6, 'Speakers', 300, 2),
(7, 'Earbuds', 100, 2);
GO
SELECT *
FROM products AS p2
WHERE price = 
   (SELECT MIN(price)
     FROM (
       SELECT TOP 3 price
	   FROM products
	   WHERE category_id = p2.category_id
	   ORDER BY price DESC
   ) AS top_price
)

--10

CREATE TABLE employees3 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employees3 (id, name, salary, department_id) VALUES
(1, 'Alex', 70000, 1),
(2, 'Blake', 90000, 1),
(3, 'Casey', 50000, 2),
(4, 'Dana', 60000, 2),
(5, 'Evan', 75000, 1);
GO 
SELECT *
FROM employees3 AS emp2
WHERE salary > 
   (SELECT AVG(salary) FROM employees3)
   AND salary < (SELECT MAX(salary)
                 FROM employees3 AS emp4
		         WHERE emp2.department_id = emp4.department_id
)
