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
--uc10 making employee working in multiple department
INSERT INTO Employee_Payroll2(Name,BasicPay,StartDate,Gender,Phone,Department,Address,TaxablePay,Deduction,IncomeTax)
 VALUES('Rohit','50000','2018/07/01','M','5454321154','Marketing','Banglore','40000','5000','2000');
 Update Employee_Payroll2 set NetPay = (BasicPay-Deduction) where Department='Marketing';
 Update Employee_Payroll2 set TaxablePay='45000' where Name='Rani';
  Update Employee_Payroll2 set TaxablePay='27000' where Name='Nayan';
 Update Employee_Payroll2 set TaxablePay='54000' where Department='Sales';
 select * from Employee_Payroll2 where Name='Rohit';

 --Tables identified in ER diagram
 --UC-11
 CREATE TABLE Employee(ID int identity(1,1) Primary Key,Name varchar(255),Gender char(1),Phone bigint,Address varchar(250));

 CREATE TABLE Payroll(EmpID int FOREIGN KEY REFERENCES Employee(ID),BasicPay float,TaxablePay float, Deduction float,IncomeTax float,NetPay float);
 select * from Payroll;

 CREATE TABLE Company(CompanytID INT IDENTITY(1,1) PRIMARY KEY,
	CompanyName VARCHAR(255)  NOT NULL);

CREATE TABLE Department(DepartmentID INT IDENTITY(1, 1) PRIMARY KEY,
DepartmentName VARCHAR(255)  NOT NULL);

ALTER TABLE Employee ADD CompanytID int FOREIGN KEY REFERENCES Company(CompanytID);


SELECT * FROM Employee;

ALTER TABLE Company
ADD empID int  FOREIGN KEY REFERENCES Employee(ID);


select * from Department;
--for many to many relation
CREATE TABLE EmployeeDepartment(EmpID int FOREIGN KEY REFERENCES Employee(ID),
DepartmentID int FOREIGN KEY REFERENCES Department(DepartmentID));

select * from EmployeeDepartment;
--INSERTING VALUES

insert into Employee(Name,Gender,Phone,Address)VALUES('RANI','F',123987564,'DELHI'),('RISHI','M',9655487564,'DELHI'),('SAHIL','M',673987564,'MUMBAI')

UPDATE Employee
SET Name='JOHN'
WHERE ID='2';
UPDATE Employee
SET Phone=698764329
WHERE ID='2';

Update Payroll set TaxablePay = (BasicPay-Deduction)WHERE EmpID=3;
Update payroll set NetPay = (TaxablePay-IncomeTax)WHERE Deduction=2000;
INSERT INTO Payroll(EmpID,BasicPay,Deduction,IncomeTax)VALUES(3,50000,5000,3000);
SELECT * FROM Payroll;
DELETE FROM Payroll WHERE IncomeTax=1000;
Update Payroll set IncomeTax=2000 WHERE TaxablePay=28000;
SELECT * FROM Company;
INSERT INTO Company VALUES('TCS'),('INFOTECH'),('SOFTTECH');
INSERT INTO Department VALUES('HR'),('FINANCE'),('TECH');
SELECT * FROM Department;
INSERT INTO EmployeeDepartment(EmpID,DepartmentID) VALUES(1,1),(2,2),(3,3);
SELECT * FROM EmployeeDepartment;

--UC-12 REDOING UC-4 RETRIEVE DATA 
SELECT Name,Gender,Phone,Address, BasicPay,Deduction,IncomeTax,TaxablePay,NetPay,CompanyName,DepartmentName,DepartmentID from Employee e,Payroll p,Company c ,Department d where e.ID=p.EmpID;

select * from Company;
update Company set empID=3 where CompanyName='SOFTTECH';

--UC-5 DATE RANGE
Alter table Employee add Startdate date;
update Employee set Startdate='2020-06-07' where ID=4;
select * from Employee;

SELECT  BasicPay,Deduction,IncomeTax,TaxablePay,NetPay FROM Payroll P,Employee e WHERE e.Startdate between Cast('2015-01-01' as Date) and GETDATE();

