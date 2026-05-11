-- Self join

create database joindb;

use joindb;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT,
    salary INT
);

INSERT INTO employees (emp_id, emp_name, department, manager_id, salary) VALUES
(1, 'Amit', 'Management', NULL, 120000),
(2, 'Neha', 'HR', 1, 75000),
(3, 'Raj', 'IT', 1, 90000),
(4, 'Simran', 'Finance', 1, 85000),
(5, 'Karan', 'IT', 3, 70000),
(6, 'Priya', 'IT', 3, 72000),
(7, 'Rohit', 'HR', 2, 50000),
(8, 'Anjali', 'HR', 2, 52000),
(9, 'Vikas', 'Finance', 4, 65000),
(10, 'Sneha', 'Finance', 4, 62000),
(11, 'Arjun', 'IT', 5, 55000),
(12, 'Pooja', 'IT', 5, 53000),
(13, 'Meera', 'HR', 7, 45000),
(14, 'Dev', 'Finance', 9, 48000),
(15, 'Nitin', 'IT', 6, 51000);

select * from employees;

select empl.emp_id,empl.emp_name,empl.manager_id,mngr.emp_id,mngr.emp_name
from employees as empl join employees as mngr
where empl.manager_id = mngr.emp_id;

select e.emp_id,e.emp_name,e.manager_id,e.department,m.emp_id,m.emp_name,m.department
from employees as e join employees as m
where e.manager_id = m.emp_id and e.department = m.department;

select e.emp_name,e.salary,m.emp_name,m.salary
from employees as e join employees as m 
on e.manager_id = m.emp_id
where e.salary > m.salary;

select e.emp_name,m.emp_name as manager_name
from employees as e left join employees as m 
on e.manager_id = m.emp_id;

select e.emp_id,e.emp_name,e.manager_id,m.emp_id,m.emp_name as mngr_name,m.manager_id,
supermngr.emp_id,supermngr.emp_name as supermngr_name
from employees as e join employees as m on(e.manager_id = m.emp_id) 
join employees as supermngr on (m.manager_id = supermngr.emp_id);

select distinct m.emp_id,m.emp_name
from employees as e join employees as m 
on e.manager_id = m.emp_id order by emp_id;

/*

Amit
 ├── Neha
 │    ├── Rohit
 │    │     └── Meera
 │    └── Anjali
 │
 ├── Raj
 │    ├── Karan
 │    │     ├── Arjun
 │    │     └── Pooja
 │    └── Priya
 │           └── Nitin
 │
 └── Simran
      ├── Vikas
      │     └── Dev
      └── Sneha

*/


-- 2nd database for practice
create database joinpractice;

use joinpractice;


CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);



INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Sales');



INSERT INTO employees VALUES
(101, 'Alice', 70000, 1, NULL),
(102, 'Bob', 60000, 2, 101),
(103, 'Charlie', 55000, 2, 102),
(104, 'David', 50000, 3, 101),
(105, 'Eva', 45000, 4, 104),
(106, 'Frank', 75000, 1, 101),
(107, 'Grace', 80000, 2, 102),
(108, 'Helen', 62000, 3, 104),
(109, 'Ian', 47000, 4, 105),
(110, 'Jack', 53000, 2, 102),
(111, 'Kevin', 49000, 3, 104),
(112, 'Laura', 72000, 1, 101),
(113, 'Mike', 58000, 4, 105),
(114, 'Nina', 61000, 2, 107),
(115, 'Oscar', 52000, NULL, 101);

select * from employees;
select * from departments;

-- Q1 Display employee names along with their department names.
select e.emp_name,d.dept_name
from employees as e join departments as d on e.dept_id = d.dept_id
order by emp_name ;

/*
question 2--Display all employees 
and their department names, including employees without departments.
*/
select e.emp_name,d.dept_name
from employees as e left join departments as d on e.dept_id = d.dept_id
order by emp_name ;
 


/*
Display employee names along with their department names.
| emp_name | dept_name |
| -------- | --------- |
| Alice    | HR        |
| Bob      | IT        |
| Charlie  | IT        |
| David    | Finance   |
| Eva      | Sales     |
| Frank    | HR        |
| Grace    | IT        |
| Helen    | Finance   |
| Ian      | Sales     |
| Jack     | IT        |
| Kevin    | Finance   |
| Laura    | HR        |
| Mike     | Sales     |
| Nina     | IT        |



Display all employees and their department names, including employees without departments.
| emp_name | dept_name |
| -------- | --------- |
| Alice    | HR        |
| Bob      | IT        |
| Charlie  | IT        |
| David    | Finance   |
| Eva      | Sales     |
| Frank    | HR        |
| Grace    | IT        |
| Helen    | Finance   |
| Ian      | Sales     |
| Jack     | IT        |
| Kevin    | Finance   |
| Laura    | HR        |
| Mike     | Sales     |
| Nina     | IT        |
| Oscar    | NULL      |


Find the number of employees in each department.
| dept_name | total_employees |
| --------- | --------------- |
| HR        | 3               |
| IT        | 5               |
| Finance   | 3               |
| Sales     | 3               |



Display all departments and the total salary paid in each department.
| dept_name | total_salary |
| --------- | ------------ |
| HR        | 217000       |
| IT        | 309000       |
| Finance   | 161000       |
| Sales     | 150000       |




Find how many employees report to each manager.
| manager | team_size |
| ------- | --------- |
| Alice   | 5         |
| Bob     | 4         |
| David   | 4         |
| Eva     | 2         |
| Grace   | 1         |



Display average salary department-wise where average salary is greater than 60000.
| dept_name | avg_salary |
| --------- | ---------- |
| HR        | 72333.33   |
| IT        | 61800      |





*/

use sakila;

select * from actor;
select * from film_actor;
select * from film;

-- Q1
select a.actor_id,concat(a.first_name,' ',a.last_name) as full_name,fa.film_id
from actor as a join film_actor as fa 
on a.actor_id = fa.actor_id;

-- Q2
select f.film_id, f.title, fa.actor_id
from film as f join film_actor as fa 
on f.film_id = fa.film_id;

-- Q3
select a.actor_id,concat(a.first_name,' ',a.last_name) as actor_name,f.title as movie
from actor as a join film_actor as fa 
on a.actor_id = fa.actor_id
join film as f on fa.film_id = f.film_id; 

-- Q4
select a.actor_id,concat(a.first_name,' ',a.last_name) as actor_name,f.film_id
from actor as a join film_actor as fa 
on a.actor_id = fa.actor_id
join film as f on fa.film_id = f.film_id
where f.length > 120 order by a.actor_id; 

-- Q5
select a.actor_id,concat(a.first_name,' ',a.last_name) as actor_name,
count(fa.film_id) as total_movies
from actor as a join film_actor as fa 
on a.actor_id = fa.actor_id
group by a.actor_id, actor_name;

-- Q6 - completed questions-
select f.title,count(fa.actor_id) as total_actors
from film as f join film_actor as fa
on f.film_id=fa.film_id
group by f.title; 