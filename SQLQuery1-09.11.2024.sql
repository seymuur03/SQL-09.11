--Task 1

CREATE DATABASE MARKET
USE MARKET
CREATE TABLE Products
(
Id int primary key ,
[Name] nvarchar(30) Not Null,
Price int  
)
SELECT * FROM Products

ALTER TABLE Products ADD Brand nvarchar(30)

INSERT INTO Products VALUES 
(1,'Product 1 ' , 1500 , 'Brand 1 '),
(2,'Product 2 ' , 1000 , 'Brand 2 '),
(3,'Product 3 ' , 500 , 'Brand 3 '),
(4,'Product 4 ' , 2000 , 'Brand 4 '),
(5,'Product 5 ' , 50 , 'Brand 5 '),
(6,'Product 6 ' , 100 , 'Brand 6 '),
(7,'Product 7 ' , 1500 , 'Brand 7 '),
(8,'Product 8 ' , 400 , 'Brand 8 '),
(9,'Product 9 ' , 900 , 'Brand 9 '),
(10,'Product 10 ' ,6500 , 'Brand 10 '),
(11,'Product 11' , 600 , 'Brand 11 '),
(12,'Product 12 ' ,7500 , 'Brand 12 '),
(13,'Product 13 ' ,1400 , 'Brand 13 '),
(14,'Product 14 ' , 1750 , 'Brand 14 ');

INSERT INTO Products VALUES 
(15,'Product 1 ' , 1500 , 'Bra ')


DELETE FROM Products WHERE Id > 12;

UPDATE Products SET Price = 2000 Where Brand = 'Brand 10' ;

SELECT AVG(Price) AS AVARAGE FROM Products

SELECT * FROM Products WHERE Price < (SELECT AVG(Price) FROM Products)

SELECT * FROM Products WHERE Price > 10

SELECT LEN(Brand) AS 'UZUNLUQ',[Name] + Brand AS 'ProductInfo' FROM Products Where LEN(Brand) > 5


-- Task 2

CREATE TABLE Employee
(
Id int primary key identity,
FullName nvarchar(255) Not Null,
Age int CHECK (Age >= 0) Not Null,
Email nvarchar (50) Not Null Unique,
Salary Decimal(7,3) CHECK (Salary > 300 AND Salary < 2000 ) Not Null
)

SELECT * FROM Employee

INSERT INTO Employee VALUES 
('Seymur Mammadov',19,'seymur@gmail.com',1500.12),
('Lorem Ipsumov',29,'lorem@gmail.com',500.50),
('Filankes Filankesov',49,'filankes@gmail.com',800.70),
('Ilham Aliyev',40,'ilham@gmail.com',695.16),
('Ipsum Loremov',18,'ipsum@gmail.com',565.26);

--ID 2 den baslama sebebim identity yazmisam ilkinde execute da error verdi deye id = 1 arada getdi.

SELECT * FROM Employee WHERE AGE >= 40 AND Salary >690

UPDATE  Employee SET Salary = 700 WHERE Id >= 4

DELETE FROM Employee WHERE Salary = 700 AND Age >= 40  



-- Task 3 

