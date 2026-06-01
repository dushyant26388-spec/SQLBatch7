-- Views in sQL

create database if not exists viewdb;
use viewdb;


CREATE TABLE departments (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id   INT PRIMARY KEY,
    name     VARCHAR(50),
    dept_id  INT,
    salary   DECIMAL(10,2),
    city     VARCHAR(50),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES
(1,'HR'), (2,'IT'), (3,'Finance');

INSERT INTO employees VALUES
(101,'Aman',    2, 70000, 'Jaipur'),
(102,'Priya',   1, 45000, 'Delhi'),
(103,'Rahul',   2, 90000, 'Mumbai'),
(104,'Sneha',   3, 55000, 'Jaipur'),
(105,'Vikram',  2, 30000, 'Pune');

select * from employees;
select * from departments;

create view dept_view as select * from departments where dept_id<3;
select * from dept_view;

create view city_sum as select city, sum(salary) from employees group by city;
select * from city_sum;

create view emp_2_col as select emp_id,name from employees;
select * from emp_2_col;

insert into emp_2_col values(107,'yash');
select * from emp_2_col;
select * from employees;

delete from emp_2_col where emp_id=101;
update emp_2_col set name='amanaa' where emp_id=102;
select * from emp_2_col;
select * from employees;


create or replace view emp_view as 
select e.emp_id,e.name,d.dept_name from employees as e
join departments d where e.dept_id=d.dept_id;

update emp_view set emp_id=100, name='happy',dept_name='jga';

select * from emp_view;