--welcome to employee payroll service
--uc1
 
CREATE DATABASE payroll_service2;
--uc2
USE payroll_service;
CREATE TABLE Employee_Payroll2(ID int identity(1,1) Primary Key,Name varchar(255),Salary float,StartDate Date);
SELECT * FROM Employee_Payroll2;
--uc3

INSERT INTO Employee_Payroll2(Name,Salary,StartDate)VALUES('Rani','50000','2018-07-06');
INSERT INTO Employee_Payroll2(Name,Salary,StartDate)VALUES('Nayan','30000','2017-07-05'),('Rohit','60000','2020-07-06');
 --uc4
SELECT * FROM Employee_Payroll2;
