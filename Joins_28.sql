create database joindb1;
use joindb1;

CREATE TABLE departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50),
location VARCHAR(50)
);
INSERT INTO departments VALUES
(10,'HR','Jaipur'),
(20,'IT','Bangalore'),
(30,'Finance','Mumbai'),
(40,'Marketing','Delhi'),
(50,'Legal','Pune');

CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
dept_id INT,
salary INT,
city VARCHAR(50)
);
INSERT INTO employees VALUES
(101,'Amit',10,45000,'Jaipur'),
(102,'Bhavna',20,72000,'Bangalore'),
(103,'Chirag',20,68000,'Bangalore'),
(104,'Divya',30,55000,'Mumbai'),
(105,'Esha',NULL,39000,'Delhi'),
(106,'Farhan',40,61000,'Delhi'),
(107,'Gaurav',60,50000,'Kolkata'),
(108,'Hina',30,83000,'Mumbai');

CREATE TABLE projects (
proj_id INT PRIMARY KEY,
proj_name VARCHAR(50),
dept_id INT,
budget INT
);
INSERT INTO projects VALUES
(1,'Payroll Revamp',10,120000),
(2,'Cloud Migration',20,500000),
(3,'Mobile App',20,300000),
(4,'Audit Automation',30,250000),
(5,'Brand Refresh',40,180000),
(6,'Data Lake',70,400000);


select * from projects;
select * from employees;
select * from departments;

-- Q1. List each employee with their department name and location.
select e.emp_id,e.emp_name,d.dept_name,d.location from employees as e
join departments as d on e.dept_id=d.dept_id;

-- Q2. Show every project along with the name of the department that owns it
select p.proj_id,p.proj_name,d.dept_name,p.budget from projects as p
join departments as d on p.dept_id=d.dept_id;

-- Q3. Show employee names together with the projects run by their own department.
select e.emp_name,d.dept_name,p.proj_name from employees as e
join departments as d  on e.dept_id = d.dept_id
join projects as p on d.dept_id=p.dept_id;

-- Q4. List ALL employees with their department name; show NULL when the employee has no matching
-- department.
select e.emp_id,e.emp_name,d.dept_id,d.dept_name from employees as e left join departments as d
on e.dept_id=d.dept_id;

-- Q5. List ALL departments with their projects; departments with no project must still appear.
select d.dept_id,d.dept_name,p.proj_name,p.budget from departments as d
left join projects as p on d.dept_id=p.dept_id;

-- Q6. Find only those employees who do NOT belong to any valid department.
select e.emp_id,e.emp_name,d.dept_id from employees as e
left join departments as d on e.dept_id=d.dept_id where d.dept_name is null;

-- Q7. List ALL departments and any employees in them, using a RIGHT JOIN with employees on the left.
select e.emp_name,d.dept_id,d.dept_name from employees as e right join departments as d
on e.dept_id=d.dept_id;

-- Q8. List ALL projects and the department that owns them, keeping projects that point to a missing department
select d.dept_id,d.dept_name,p.proj_id,p.proj_name from departments as d right join projects as p 
on d.dept_id=p.dept_id;

-- Q9. Find departments that currently have NO employee assigned.
select d.dept_id,d.dept_name,d.location from departments as d left join employees as e 
on d.dept_id=e.dept_id where e.emp_id is null;

-- Q10. Produce every possible pairing of the Finance/Legal departments with employees earning above 70000.
select e.emp_name,e.salary,d.dept_name from employees as e cross join departments as d
where d.dept_name in ( 'finance','legal') and e.salary > 70000;

-- Q11. Pair every project having a budget of at least 400000 with every department located in Mumbai or Pune.
 select  p.proj_name,p.budget,d.dept_name,d.location from projects as p cross join departments as d
 where  d.location in ( 'mumbai','pune') and p.budget >= 400000 order by p.budget desc;
 
 -- Q12. How many total row combinations result from CROSS JOIN of employees and departments? Show the count
 select count(*) as totalcombinations from employees cross join departments;

-- Q13. Show employees whose salary is greater than 60000.
select * from employees where salary > 60000;

-- Q14. Show all employees based in Delhi or Mumbai.
select emp_id,emp_name,salary,city from employees where city in ('delhi','mumbai');

-- Q15. Show employees whose dept_id is NULL (unassigned employees).
select emp_id,emp_name,dept_id,salary from employees  where dept_id is null;

-- Q16. Show departments located in Bangalore or Delhi
select * from departments where location in ('bangalore','delhi');

-- Q17. Show departments whose dept_id is 30 or higher.
select * from departments where dept_id >= 30;

-- Q18. Show departments whose name starts with the letter "F" or "L"
select * from departments where dept_name like 'F%' or dept_name like 'L%' ;

-- Q19. Show projects with a budget between 200000 and 400000 (inclusive).
select * from projects where budget between 200000 and 400000;

-- Q20. Show all projects that belong to dept_id 20.
select * from projects where dept_id = 20;

-- Q21. Show projects whose name contains the word "a" and budget is under 300000.
select proj_id,proj_name,budget from projects where proj_name like '%a%' and budget <300000;

-- Q22. Show employee name, department name, location and project name for all matching rows across all three
-- tables.
select e.emp_name,d.dept_name,d.location,p.proj_name,p.budget 
from employees as e join departments as d on e.dept_id=d.dept_id
join projects as p on d.dept_id=p.dept_id;

-- Q23. Show ALL employees, plus department and project details where available (keep employees even with no
-- dept/project).
select e.emp_id,e.emp_name,d.dept_name,p.proj_name 
from employees as e left join departments as d on e.dept_id = d.dept_id
left join projects as p on d.dept_id=p.dept_id; 

-- Q24. Show employees earning more than 60000 along with department and any project over 250000 budget.
select e.emp_name,e.salary,d.dept_name,p.proj_name,p.budget 
from employees as e join departments as d on e.dept_id=d.dept_id
join projects as p on d.dept_id=p.dept_id 
where e.salary > 60000 and p.budget > 250000;

-- Q25. List ALL departments with their employees and projects, including departments having neither.
select d.dept_id,d.dept_name,e.emp_name,p.proj_name from departments as d
left join employees as e on d.dept_id=e.dept_id
left join projects as p on d.dept_id = p.dept_id;

-- Q26. Show employees who work in a department located in Bangalore or Mumbai, along with the projects of that
-- department.
SELECT e.Emp_Name,
       d.Dept_Name,
       d.Location,
       p.Proj_Name
FROM Employees e
INNER JOIN Departments d
ON e.Dept_ID = d.Dept_ID
INNER JOIN Projects p
ON d.Dept_ID = p.Dept_ID
WHERE d.Location IN ('Bangalore', 'Mumbai');

-- Q27. Pair employees who work in the same city (avoid duplicate pairs and self-pairing).
SELECT e1.Emp_Name AS Employee1,
       e2.Emp_Name AS Employee2,
       e1.City
FROM Employees e1
INNER JOIN Employees e2
ON e1.City = e2.City
WHERE e1.Emp_ID < e2.Emp_ID;

-- Q28. Show every project along with employees of that department; keep projects with no employees.
SELECT p.Proj_Name,
       d.Dept_Name,
       e.Emp_Name
FROM Projects p
LEFT JOIN Departments d
ON p.Dept_ID = d.Dept_ID
LEFT JOIN Employees e
ON d.Dept_ID = e.Dept_ID;