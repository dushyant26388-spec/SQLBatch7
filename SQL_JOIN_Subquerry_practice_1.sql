CREATE DATABASE sql_practice;
USE sql_practice;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    manager_id INT
);

INSERT INTO employees VALUES
(101, 'Alice Johnson', 'IT', 72000, NULL),
(102, 'Bob Smith', 'IT', 65000, 101),
(103, 'Carol White', 'HR', 58000, NULL),
(104, 'David Brown', 'HR', 54000, 103),
(105, 'Eva Green', 'Finance', 80000, NULL),
(106, 'Frank Black', 'Finance', 75000, 105),
(107, 'Grace Lee', 'IT', 68000, 101),
(108, 'Henry Wilson', 'Marketing', 60000, NULL),
(109, 'Ivy Turner', 'Marketing', 56000, 108),
(110, 'Jack Davis', 'Finance', 70000, 105),
(111, 'Karen Moore', 'IT', 63000, 101),
(112, 'Leo Harris', 'HR', 50000, 103),
(113, 'Mia Clark', 'Marketing', 62000, 108),
(114, 'Nate Lewis', 'Finance', 78000, 105),
(115, 'Olivia Walker', 'IT', 71000, 101),
(116, 'Paul Hall', 'HR', 53000, 103),
(117, 'Quinn Young', 'Marketing', 59000, 108),
(118, 'Rachel King', 'Finance', 82000, 105),
(119, 'Sam Scott', 'IT', 66000, 101),
(120, 'Tina Adams', 'HR', 55000, 103);

select * from employees;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    amount INT,
    order_date DATE
);

INSERT INTO orders VALUES
(1001, 201, 301, 1500, '2024-01-05'),
(1002, 202, 302, 2300, '2024-01-12'),
(1003, 203, 303, 800, '2024-02-03'),
(1004, 201, 304, 3200, '2024-02-14'),
(1005, 204, 301, 1100, '2024-03-01'),
(1006, 205, 302, 4500, '2024-03-15'),
(1007, 202, 303, 950, '2024-03-22'),
(1008, 206, 304, 2100, '2024-04-05'),
(1009, 203, 301, 1750, '2024-04-18'),
(1010, 207, 302, 3300, '2024-04-30'),
(1011, 204, 303, 680, '2024-05-10'),
(1012, 208, 304, 2900, '2024-05-22'),
(1013, 205, 301, 1200, '2024-06-08'),
(1014, 201, 302, 2700, '2024-06-15'),
(1015, 209, 303, 500, '2024-06-28'),
(1016, 206, 304, 3800, '2024-07-07'),
(1017, 207, 301, 1600, '2024-07-19'),
(1018, 210, 302, 4100, '2024-07-25'),
(1019, 208, 303, 720, '2024-08-02'),
(1020, 209, 304, 2200, '2024-08-14');

select * from orders;
select * from employees;

select department, count(*) as emp_count
from employees group by department order by department;

select department, round(avg(salary),2) as avg_salary
from employees group by department
having avg_salary > 60000 order by department;

-- Q3. Show the total salary paid per department, ordered by total salary descending.
select department, sum(salary) as total_salary from employees
group by department order by total_salary desc;

-- Q4. Find departments that have more than 4 employees AND an average salary above 55,000.
select department, count(*) as emp_count, round(avg(salary),2) as avg_salary from employees
group by department having emp_count > 4 and avg_salary > 55000 order by department ;

-- Q5. Using the orders table, find customer_ids who have placed more than 2 orders and whose total order
-- amount exceeds 5,000.
select customer_id, count(*) as order_count, sum(amount) as total_amount from orders group by customer_id
having total_amount > 5000;

