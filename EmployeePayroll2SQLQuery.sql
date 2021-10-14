--welcome to employee payroll service
--uc1
 --Create DataBase
CREATE DATABASE payroll_service2;
--uc2
--Create table for DataBase
USE payroll_service;
CREATE TABLE Employee_Payroll2(ID int identity(1,1) Primary Key,Name varchar(255),Salary float,StartDate Date);
SELECT * FROM Employee_Payroll2;
--uc3
--insert data operation
INSERT INTO Employee_Payroll2(Name,Salary,StartDate)VALUES('Rani','50000','2018-07-06');
INSERT INTO Employee_Payroll2(Name,Salary,StartDate)VALUES('Nayan','30000','2017-07-05'),('Rohit','60000','2020-07-06');
 --uc4
 --Retrieve all data from table
 --uc4
SELECT * FROM Employee_Payroll2;
--uc5
----Retrieve Specific Data
SELECT Name,StartDate FROM Employee_Payroll2 WHERE Name='Rani';
SELECT * FROM Employee_Payroll2 WHERE StartDate BETWEEN CAST('2018-01-01'
AS DATE) AND GETDATE();
