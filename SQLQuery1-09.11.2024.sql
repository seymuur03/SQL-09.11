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

CREATE DATABASE Relations
USE Relations

--OneToOne
CREATE TABLE Countries
(
Id int primary key,
[Name] nvarchar(80) UNIQUE ,
[Population] int 
)

CREATE TABLE Capitals
(
Id int primary key,
[Name] nvarchar(80) UNIQUE ,
CountryId int foreign key references Countries(Id)
)

--OneToMany
CREATE TABLE Teams
(
Id int primary key,
[Name] nvarchar(80) UNIQUE Not Null,
CountOfPlayers int 
)

CREATE TABLE Players 
(
Id int primary key,
[Name] nvarchar(80) Not Null,
TeamId int foreign key references Teams(Id)
)

--ManyToMany
CREATE TABLE BookReaders
(
Id int primary key,
[Name] nvarchar(80) Not Null,
)

CREATE TABLE Books
(
Id int primary key,
[Name] nvarchar(80) Not Null
)
ALTER TABLE Books ADD Genres nvarchar(80)
ALTER TABLE Books ADD Authors nvarchar(80)

CREATE TABLE ReadersBooks
(
Id int primary key,
BooksReadersId int foreign key references BookReaders(Id),
BookId int foreign key references Books(Id)
)


INSERT INTO Countries VALUES 
(1,'Azerbaijan',11),
(2,'Turkey',90),
(3,'Russia',143),
(4,'Pakistan',240);

SELECT * FROM Countries

UPDATE Countries SET Population = 230 WHERE Id = 4 
DELETE FROM Countries WHERE Population=230

INSERT INTO Capitals VALUES 
(1,'Baku',1),
(2,'Moscow',3),
(3,'Ankara',2);

SELECT * FROM Capitals

INSERT INTO Teams VALUES
(1,'Wolves',5),
(2,'Spontan',6),
(3,'WithoutWhy',4),
(4,'Winners',5);

SELECT * FROM Teams

INSERT INTO Players VALUES
(1,'Seymur',3),
(2,'Rasim',3),
(3,'Arif',3),
(4,'Ilham',1),
(5,'Yusif',2),
(6,'Mahir',1),
(7,'Lorem',4),
(8,'Ipsum',4),
(9,'Ronaldo',2);

SELECT * FROM Players

INSERT INTO BookReaders VALUES 
(1,'Seymur'),
(2,'Lorem'),
(3,'Ipsum'),
(4,'Filankes'),
(5,'Filan');

SELECT * FROM BookReaders

INSERT INTO Books VALUES
(1,'Lord of the Rings','Dram','Tolkien'),
(2,'Hobbit','Komedi','Tolkien'),
(3,'Harry Potter','Dram','Rowling');

SELECT * FROM Books

INSERT INTO ReadersBooks VALUES 
(1,1,1),
(2,1,3),
(3,2,1),
(4,2,2),
(5,2,3),
(6,3,3),
(7,4,2),
(8,4,3),
(9,5,1);

SELECT * FROM ReadersBooks


--Task 4 

CREATE DATABASE BOOKSTORE
USE BOOKSTORE
ALTER DATABASE BOOKSTORE MODIFY NAME = [Library]

CREATE TABLE Readers 
(
Id int primary key identity,
FullName nvarchar(100) Not Null
)

CREATE TABLE Details 
(
Id int primary key identity,
Email nvarchar(100) Unique Not Null,
PhoneNumber nvarchar(100) Unique Not NULL,
Adress nvarchar(150) Not Null,
ReaderId int foreign key references Readers(Id)
)

CREATE TABLE Genres 
(
Id int primary key identity,
[Name] nvarchar(100) UNIQUE Not Null
)

CREATE TABLE Authors  
(
Id int primary key identity,
FullName nvarchar(100) UNIQUE Not Null,
Country nvarchar(100) Not Null
)

CREATE TABLE Shelves
(
Id int primary key identity,
[Name] nvarchar(100) UNIQUE
)

CREATE TABLE Books
(
Id int primary key identity,
[Name] nvarchar(100) Not Null,
GenreId int foreign key references Genres(Id),
AuthorId int foreign key references Authors(Id),
ShelfId int foreign key references Shelves(Id)
)

CREATE TABLE ReadersBooks
(
Id int primary key identity,
ReaderId int foreign key references Readers(Id),
BookId int foreign key references Books(Id),
Isreturned bit 
)

INSERT INTO Readers VALUES
('Seymur Mammadov'),
('Lorem Ipsumov'),
('Ipsum Loremov'),
('Filankes Filankesov'),
('Any one')
SELECT * FROM Readers

INSERT INTO Details VALUES
('seymur@gmail.com','+994558429775','R.Quliyev 28',1),
('lorem@gmail.com','+994558862775','Mehmandarov 12',2),
('ipsum@gmail.com','+994558862575','Ehmedli',3),
('filankes@gmail.com','+994558759621','Hezi aslanov',4),
('any@gmail.com','+994502654126','Koroglu',5);
SELECT * FROM Details

INSERT INTO Genres VALUES
('Horror'),
('Dram'),
('Romance'),
('Fantasy'),
('Mystery'),
('Paranormal');
INSERT INTO Genres VALUES
('Fiction')
SELECT * FROM Genres

INSERT INTO Authors VALUES
('William Shakespeare','England'),
('Stephen King','Portland'),
('Fyodor Dostoevsky','Russia'),
('Stefan Zweig','Austria');
SELECT * FROM Authors
DELETE FROM Authors WHERE ID = 2 
INSERT INTO Authors VALUES
('Stephen King','America')

INSERT INTO Shelves VALUES
('A'),
('B'),
('C'),
('D');
SELECT * FROM Shelves

INSERT INTO Books VALUES
('Amok',7,4,1),
('The Royal Game',2,4,1),
('The World of Yesterday',3,4,1),
('Hamlet',1,1,2),
('Romeo and Juliet',3,1,2),
('Crime and Punishment',4,3,3),
('Demons',6,3,3),
('it',5,5,4),
('The Shining',1,5,4);

SELECT * FROM Books

INSERT INTO ReadersBooks VALUES 
(1,1,1),
(1,5,1),
(1,9,0),
(2,3,0),
(3,4,1),
(3,1,1),
(4,8,0),
(5,2,1),
(5,5,0);

SELECT * FROM ReadersBooks




