CREATE DATABASE DemoData;
GO
USE DemoData;
GO
CREATE TABLE Products (ID int, ProductName nvarchar(max));
GO
insert into Products (ID, ProductName) values (1,"Car");
insert into Products (ID, ProductName) values (2,"Truck");
insert into Products (ID, ProductName) values (3,"Motorcycle");
GO