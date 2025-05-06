create database homework_1
go 
use homework_1

/*
Data - bu qandaydur ma'lumot qayta ishlasa boladigan va saqlasa bo'ladigan.
Database - bu yaratilgan ma'lumotlarni saqlaydigan joy keyinchalik qayta ishlash maqsad qilingan.
Relational database - bog'langan tablitsalar korinishida yaratilgan ma'lumotlar bazasi.
Table - ma'lumotlar bazasida turadigan jadval, unda ma'lumotlar saqlanadi
*/

/* 
1. Tranzaksiyani qolla quvatlaydi
2. Saqlanish jarayonlari
3. Kuchli havsizlik
4. Nushalash
5. Microsoft dasturlari bilan toliq integratsiya
*/

/*
Windows Authentication
SQL Server Authentication
*/

create table Students (
StudentID int primary key,
Name varchar(50),
Age int
)

select * from Students

/*
SQL Server - bu ma'lumotlar saqlanadigan va boshqariladigan joy
SSMS - bu SQL dasturida ishlash uchun kerak bolgan tool
SQL - SQL Serverda ishlash uchun kerak boladigan dasturlash tili
*/


/*
DQL	(Data Query Language) - Ma'lumotlarni oqish - SELECT * FROM Students;
DML	(Data Manipulation Language) - Ma'lumotlar bilan ishlash - INSERT, UPDATE, DELETE
DDL	(Data Definition Language) - Struktura bilan ishlash - CREATE, ALTER, DROP
DCL	(Data Control Language) - Ruxsatlar bilan ishlash -	GRANT, REVOKE
TCL	(Transaction Control Language) - Tranzaksiyalar bilan ishlash - BEGIN, COMMIT, ROLLBACK
*/

insert into Students (StudentID, Name, Age) values
(1, 'Ale', 15),
(2, 'Bek', 20),
(3, 'Vali', 30)