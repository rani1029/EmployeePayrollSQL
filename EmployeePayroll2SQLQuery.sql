--welcome to employee payroll service
--uc1
 --Create DataBase
CREATE DATABASE payroll_service2;
--uc2
--Create table for DataBase
USE payroll_service2;
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

--uc6
--Alter the table to add gender column and add data
ALTER TABLE Employee_Payroll2 ADD Gender char(1); --it first set gender as null then it can be update as follows
UPDATE Employee_Payroll2 SET Gender='M';
UPDATE Employee_Payroll2 SET Gender='F' WHERE Name='Rani';

--uc7
--calculate sum of salary of specific gender
SELECT SUM(Salary) FROM Employee_Payroll2
WHERE Gender = 'F' GROUP BY Gender;
SELECT SUM(Salary) FROM Employee_Payroll2
WHERE Gender = 'M' GROUP BY Gender;

--calculate Average of salary of specific gender

SELECT AVG(Salary) FROM Employee_Payroll2
WHERE Gender = 'M' GROUP BY Gender;


SELECT AVG(Salary) FROM Employee_Payroll2
WHERE Gender = 'F' GROUP BY Gender;

--calculate MINIMUM of salary of specific gender

SELECT MIN(Salary) FROM Employee_Payroll2
WHERE Gender = 'M' GROUP BY Gender;

SELECT MIN(Salary) FROM Employee_Payroll2
WHERE Gender = 'F' GROUP BY Gender;

--calculate MAXIMUM of salary of specific gender

SELECT MAX(Salary) FROM Employee_Payroll2
WHERE Gender = 'M' GROUP BY Gender;

SELECT MAX(Salary) FROM Employee_Payroll2
WHERE Gender = 'F' GROUP BY Gender;

--COUNT FUNCTION

SELECT COUNT(Salary) FROM Employee_Payroll2
WHERE Gender = 'M' GROUP BY Gender;

SELECT COUNT(Salary) FROM Employee_Payroll2
WHERE Gender = 'F' GROUP BY Gender;
--uc8
ALTER TABLE Employee_Payroll2 ADD Phone bigint,Address varchar(250),Department varchar(250) not null;
UPDATE Employee_Payroll2 SET Address='INDIA';
UPDATE Employee_Payroll2 SET Department='Finance';
SELECT * FROM Employee_Payroll2;
UPDATE Employee_Payroll2 set Phone='453267899',Address='chennai' where Name='Nayan';
UPDATE Employee_Payroll2 set Phone='453267899',Address='Mumbai' where Name='Rani';
UPDATE Employee_Payroll2 set Phone='453267899',Address='Banglore' where Name='Rohit';
UPDATE Employee_Payroll2 set Department='HR'where Name='Nayan';
UPDATE Employee_Payroll2 set Department='Sales'where Name='Rohit';

UPDATE Employee_Payroll2 SET Phone='6754389654' where Name='Rani';
UPDATE Employee_Payroll2 SET Phone='5454321154' where Name='Rohit';

--Uc9
---Rename Colomn Salary renamed as Basic pay---
Exec sp_rename 'Employee_payroll2.Salary', 'BasicPay';
alter table Employee_Payroll2 ADD  TaxablePay float, Deduction float,IncomeTax float,NetPay float;
Update Employee_Payroll2 set Deduction = '3000' where Department = 'HR';
Update Employee_Payroll2 set Deduction = '5000' where Department = 'Finance';
Update Employee_Payroll2 set Deduction = '6000' where Department = 'Sales';
Update Employee_Payroll2 set TaxablePay = null; 
Update Employee_Payroll2 set IncomeTax = '2000'; 
Update Employee_Payroll2 set NetPay = (BasicPay-Deduction);




