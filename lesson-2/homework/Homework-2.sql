-- Basic-Level Tasks 

--1
create table Employees(
       EmpID INT,
	   Name VARCHAR(50),
	   Salary INT
);

--2
 INSERT INTO Employees (EmpID, Name, Salary)
 values(1, 'Ali', 300.000),
       (2, 'Vali', 100.000)

--3
update Employees
set Salary=7000
where EmpID=1

--4
delete from Employees
where EmpID=2

--5
/*DELETE - WHERE kodi bilan ishlatsa boladi va qaysidur aniq narsani ochirmoqchi bolganda ishlatililadi
  TRUNCATE - bu kod jadvaldagi malumotlarni jadval column'lariga tegmasdan ochirib yuboradi
  DROP - bu kod data bazadan ham toliq ochirib yuborish uchun ishlatililadi
*/

--6
alter table Employees
alter column Name varchar(100)

--7
alter table Employees
add departman varchar(100)

--8
alter table Employees
alter column Salary float

--9
create table Departmants(
       DepartmentID int PRIMARY KEY,
	   DepartmentName varchar(100)
)

--10
truncate table Employees



select * from Departmants
select * from Employees



--Intermediate-Level Tasks

alter table Departmants
add Salary int

update Departmants
set salary=5000 where DepartmentID=1;
update Departmants
set salary=1000 where DepartmentID=2;
update Departmants
set salary=3000 where DepartmentID=3;
update Departmants
set salary=8000 where DepartmentID=4;

alter table Departmants
add Departmant varchar(50)


create table Employees(
       EmpID INT,
	   Name VARCHAR(50),
	   Salary INT,
	   Departmant VARCHAR(50)
);
go
insert into Employees(EmpID, Name, Salary, Departmant)
values(1, 'Davron', 6000, NULL),
      (2, 'Bahora', 4000, NULL),
	  (3, 'Diyora', 8000, NULL)

--1
insert into Departmants(DepartmentID, DepartmentName)
values (1, 'G''ani'),
       (2, 'Vali'),
	   (3, 'Farhod')


insert into Departmants(DepartmentID, DepartmentName)
select 4, 'G''ulom'
      

--2
update Employees
set Departmant = Management 
where salary>5000
--bu shartga tshunolmdim

--3
truncate table Departmants

--4
alter table Employees
drop column Departmant

--5
exec sp_rename 'Employees', 'StaffMembers'
select * from StaffMembers

--6
drop  table Departmants


--Advanced-Level Tasks

--1
create table Products(
       ProductID int PRIMARY KEY,
	   ProductName varchar(100),
	   Category varchar(30),
	   Price int,
	   Size int)

--2
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
	Category VARCHAR(30),
    Price DECIMAL(10, 2) CHECK (Price > 0),
	Size INT
);

--3
alter table Products
add StockQuantity int default 50

--4
exec sp_rename 'Category', 'ProductCategory', 'Column';
--Bu shartni ham tshunolmadim

--5
insert into Products(ProductID, ProductName, Category, Price, Size)
values (1, 'Olma', 'Meva', 5, 2),
       (2, 'Banan', 'Meva', 8, 7),
	   (3, 'Tarvuz', 'Poliz ekini', 10, 8),
	   (4, 'Qovun', 'Poliz ekini', 20, 5),
	   (5, 'Kivi', 'Meva', 5, 4);

--6
select * into Products_Backup
from Products;

--7
exec sp_rename 'Products', 'Inventory'

--8
ALTER TABLE Inventory
DROP CONSTRAINT CK__Products__Price__44FF419A;
go
alter table Inventory
alter column Price float
go
ALTER TABLE Inventory
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0);

--9
ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000, 5);


	   
select * from Products_Backup
select * from Inventory