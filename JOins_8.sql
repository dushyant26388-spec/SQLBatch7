create database joinsdb;

use joinsdb;

CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance'),
(104, 'Marketing');

CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR(50),
DepartmentID INT
);

INSERT INTO Employees (EmployeeID, EmployeeName, DepartmentID)
VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 105), -- No matching department
(4, 'David', NULL), -- No department assigned
(5, 'Eva', 101);

select * from departments;
select * from employees;

use world;

select * from country;
select * from city;

select c.id,c.name,c.countrycode,cty.code,cty.name from city as c
join country as cty on c.countrycode=cty.code ;

