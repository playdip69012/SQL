create database homework_3
go 
use homework_3

--1 Easy

/*
BULK INSERT - bu kamanda SQL serverda katta miqdordagi
row ma'lumotlarni tez SQL serverga otkazish uchun ishlatiladi.

Misol:

BULK INSERT Products
FROM 'C:\data\products.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
*/

--2

/*
SQL server quydagi tipdagi fayllar bilan ishlaydi:
CSV (Comma-Separated Values); 
TXT (Text File);
XML (eXtensible Markup Language); 
JSON (JavaScript Object Notation);
*/

--3

CREATE TABLE Products (
   ProductID INT PRIMARY KEY,
   ProductName VARCHAR(50),
   Price DECIMAL(10,2)
);

--4

INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1200.00),
(2, 'Smartphone', 800.50),
(3, 'Headphones', 150.74);
;

--5

/*
NULL - jadvalni qaysidur qismida ma'lumot yoq degani.
NOT NULL - jadvalga ma'lumot yozilishi shart degani.
*/

--6

ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);

SELECT * FROM Products

--7

/*
SQL Serverda kamentariya yozishni ikkita turi bor:

--
/*...*/

*/

--8

ALTER TABLE Products
ADD CategoryID INT;


--9

CREATE TABLE Categories(
   CategoryID INT PRIMARY KEY,
   CategoryName VARCHAR(50) UNIQUE
);

SELECT * FROM Categories

--10

/*
IDENTITY - bu kamanda avtamatik ravishda har bir stolbni ozi toldirib boradi.

Misol:

CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);
*/

--1 Medium

CREATE TABLE Employees(
   EmployeeID INT,
   FirstName VARCHAR(50),
   LastName VARCHAR(50),
   Email VARCHAR(50),
   Salary FLOAT
);
GO
BULK INSERT [homework_3].[dbo].[Employees]
FROM 'C:\Users\MSI\Downloads\employees_.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM Employees

--2

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

SELECT * FROM Products

--3

/*
PRIMERY KEY - jadvalda faqatgina bitta PRIMERY KEY bo'lishi mumkin.
UNIQUE - jadvalda bir nechta UNIQUE bo'lishi mumkin va NULL ham.
*/

--4

ALTER TABLE Products
ADD CONSTRAINT CHK_Price
CHECK (Price > 0);

SELECT * FROM Products

--5

ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;

--6

SELECT ProductName, ISNULL(Price, 0) AS Price
FROM Products;

--7
/*
FOREIGN KEY - bu jadvallarni bir birsi bilan bog'lash uchun ishlatiladi
*/

--1 Hard

CREATE TABLE Customers (
   CustomerID INT PRIMARY KEY,
   FullName VARCHAR(100),
   Age INT,
     CONSTRAINT CHK_Age CHECK (Age >= 18)
);

SELECT * FROM Customers


--2

CREATE TABLE FOR_CHAECK (
   ID INT IDENTITY (100, 10 )PRIMARY KEY,
   Name VARCHAR(50)
);

SELECT * FROM FOR_CHAECK

--3

CREATE TABLE ProductDetales(
   OrderID INT,
   ProductID INT,
   Quantity INT,
   PRIMARY KEY (OrderID, ProductID)
);

SELECT * FROM ProductDetales

--4

/*
ISNULL - faqatgina 2 ta argument olaoladi.
COALESCE - birnechta argumentlar oladi.
*/

--5

CREATE TABLE Employees (
   EmpID INT PRIMARY KEY,
   FullName VARCHAR(100),
   Email VARCHAR(100) UNIQUE,
   Position VARCHAR(50)
);

--6


