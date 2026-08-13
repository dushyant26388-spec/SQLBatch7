CREATE DATABASE subquery_practice;

USE subquery_practice;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    manager_id INT,
    hire_year INT
);

INSERT INTO employees
(emp_id, emp_name, department, salary, manager_id, hire_year)
VALUES
(101, 'Alice Johnson', 'IT', 72000, NULL, 2018),
(102, 'Bob Smith', 'IT', 65000, 101, 2019),
(103, 'Carol White', 'HR', 58000, NULL, 2017),
(104, 'David Brown', 'HR', 54000, 103, 2020),
(105, 'Eva Green', 'Finance', 80000, NULL, 2016),
(106, 'Frank Black', 'Finance', 75000, 105, 2018),
(107, 'Grace Lee', 'IT', 68000, 101, 2021),
(108, 'Henry Wilson', 'Marketing', 60000, NULL, 2017),
(109, 'Ivy Turner', 'Marketing', 56000, 108, 2022),
(110, 'Jack Davis', 'Finance', 70000, 105, 2019),
(111, 'Karen Moore', 'IT', 63000, 101, 2020),
(112, 'Leo Harris', 'HR', 50000, 103, 2021),
(113, 'Mia Clark', 'Marketing', 62000, 108, 2018),
(114, 'Nate Lewis', 'Finance', 78000, 105, 2019),
(115, 'Olivia Walker', 'IT', 71000, 101, 2017),
(116, 'Paul Hall', 'HR', 53000, 103, 2020),
(117, 'Quinn Young', 'Marketing', 59000, 108, 2021),
(118, 'Rachel King', 'Finance', 82000, 105, 2016),
(119, 'Sam Scott', 'IT', 66000, 101, 2022),
(120, 'Tina Adams', 'HR', 55000, 103, 2019);

-- oredrs table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    amount INT,
    order_date DATE,
    status VARCHAR(20)
);

INSERT INTO orders
(order_id, customer_id, product_id, amount, order_date, status)
VALUES
(1001, 201, 301, 1500, '2024-01-05', 'Delivered'),
(1002, 202, 302, 2300, '2024-01-12', 'Delivered'),
(1003, 203, 303, 800, '2024-02-03', 'Delivered'),
(1004, 201, 304, 3200, '2024-02-14', 'Delivered'),
(1005, 204, 301, 1100, '2024-03-01', 'Pending'),
(1006, 205, 302, 4500, '2024-03-15', 'Delivered'),
(1007, 202, 303, 950, '2024-03-22', 'Cancelled'),
(1008, 206, 304, 2100, '2024-04-05', 'Delivered'),
(1009, 203, 301, 1750, '2024-04-18', 'Pending'),
(1010, 207, 302, 3300, '2024-04-30', 'Delivered'),
(1011, 204, 303, 680, '2024-05-10', 'Cancelled'),
(1012, 208, 304, 2900, '2024-05-22', 'Delivered'),
(1013, 205, 301, 1200, '2024-06-08', 'Delivered'),
(1014, 201, 302, 2700, '2024-06-15', 'Pending'),
(1015, 209, 303, 500, '2024-06-28', 'Delivered'),
(1016, 206, 304, 3800, '2024-07-07', 'Delivered'),
(1017, 207, 301, 1600, '2024-07-19', 'Delivered'),
(1018, 210, 302, 4100, '2024-07-25', 'Delivered'),
(1019, 208, 303, 720, '2024-08-02', 'Cancelled'),
(1020, 209, 304, 2200, '2024-08-14', 'Delivered');

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price INT,
    stock_qty INT
);

INSERT INTO products
(product_id, product_name, category, price, stock_qty)
VALUES
(301, 'Laptop', 'Electronics', 55000, 30),
(302, 'Smartphone', 'Electronics', 22000, 80),
(303, 'Headphones', 'Electronics', 3500, 120),
(304, 'Monitor', 'Electronics', 18000, 45),
(305, 'Keyboard', 'Accessories', 1500, 200),
(306, 'Mouse', 'Accessories', 900, 250),
(307, 'Desk Chair', 'Furniture', 8500, 40),
(308, 'Standing Desk', 'Furniture', 22000, 15),
(309, 'Webcam', 'Electronics', 4200, 70),
(310, 'USB Hub', 'Accessories', 1200, 180),
(311, 'Notebook', 'Stationery', 150, 500),
(312, 'Pen Set', 'Stationery', 250, 600),
(313, 'Printer', 'Electronics', 12000, 25),
(314, 'Scanner', 'Electronics', 9000, 20),
(315, 'External SSD', 'Electronics', 7500, 60),
(316, 'Lamp', 'Furniture', 2200, 90),
(317, 'Whiteboard', 'Office Supplies', 3800, 35),
(318, 'Cable Organiser', 'Accessories', 600, 300),
(319, 'Power Bank', 'Electronics', 2800, 100),
(320, 'Smart Watch', 'Electronics', 15000, 55);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50),
    join_year INT
);

INSERT INTO customers
(customer_id, customer_name, city, country, join_year)
VALUES
(201, 'Aarav Mehta', 'Mumbai', 'India', 2021),
(202, 'Priya Sharma', 'Delhi', 'India', 2020),
(203, 'Rohan Gupta', 'Pune', 'India', 2022),
(204, 'Sunita Patel', 'Ahmedabad', 'India', 2021),
(205, 'Vikram Rao', 'Bangalore', 'India', 2019),
(206, 'Neha Singh', 'Chennai', 'India', 2023),
(207, 'Arjun Kumar', 'Hyderabad', 'India', 2020),
(208, 'Deepa Nair', 'Kochi', 'India', 2022),
(209, 'Sanjay Joshi', 'Jaipur', 'India', 2021),
(210, 'Meera Iyer', 'Coimbatore', 'India', 2023),
(211, 'Ravi Verma', 'Lucknow', 'India', 2020),
(212, 'Anita Das', 'Kolkata', 'India', 2019),
(213, 'Kiran Reddy', 'Vizag', 'India', 2022),
(214, 'Pooja Shah', 'Surat', 'India', 2021),
(215, 'Amit Bose', 'Nagpur', 'India', 2023),
(216, 'Tara Menon', 'Trivandrum', 'India', 2020),
(217, 'Nikhil Kulkarni', 'Nashik', 'India', 2022),
(218, 'Swati Chatterjee', 'Bhopal', 'India', 2019),
(219, 'Rahul Pandey', 'Patna', 'India', 2021),
(220, 'Divya Tiwari', 'Indore', 'India', 2023);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    budget INT,
    location VARCHAR(50),
    head_id INT
);

INSERT INTO departments
(dept_id, dept_name, budget, location, head_id)
VALUES
(1, 'IT', 500000, 'Bangalore', 101),
(2, 'HR', 200000, 'Mumbai', 103),
(3, 'Finance', 600000, 'Delhi', 105),
(4, 'Marketing', 300000, 'Chennai', 108);




select * from employees;
select * from orders;
select * from products;
select * from customers;
select * from departments;



-- Q1. Find the names, departments, and salaries of all employees whose salary is greater than the average salary of
-- all employees in the company. The company-wide average salary should be computed inside a subquery.
select emp_name,department,salary from employees
 where salary > (select avg(salary) from employees) order by salary desc;

-- Q2. Display the emp_id, emp_name, department, and salary of the single highest-paid employee in the entire
-- company. Use a subquery that returns the maximum salary, and filter the main query to match it.
select emp_id, emp_name, department,salary from employees 
where salary=(select max(salary) from employees);

-- Q3. Display the emp_id, emp_name, department, and salary of the employee with the lowest salary in the entire
select emp_id, emp_name, department,salary from employees 
where salary=(select min(salary) from employees);

-- Q4. Find all employees (other than Rachel King herself) who were hired in the same year as Rachel King. Return
-- their emp_name, department, and hire_year. Use a single-row subquery to find Rachel King's hire year.
select emp_name, department,hire_year from employees where hire_year=
(select hire_year from employees where emp_name = "Rachel King") and emp_name != "Rachel King";

-- Q5. List all products whose price is greater than the average price across all products in the entire products table.
-- Show product_name, category, and price, ordered by price descending.
select product_name, category,price from products 
where price > (select avg(price) from products) order by price desc;

-- Q6. Retrieve the product_id, product_name, category, and price of the single most expensive product in the entire
-- products table.
select product_id, product_name,category,price from products where price = (select max(price) from products);

-- Q7. Retrieve the product_id, product_name, category, and price of the cheapest product in the entire products
-- table.
select product_id, product_name,category,price from products where price = (select min(price) from products);

-- Q8. List all orders whose amount is greater than the average order amount across all orders in the orders table.
-- Show order_id, customer_id, and amount, ordered by amount descending.
select  order_id, customer_id,amount from orders 
where amount > (select avg(amount) from orders) order by amount desc;

-- Q9. Find the order_id, customer_id, amount, and order_date of the single most expensive order ever placed (the
-- order with the highest amount in the entire orders table).
select order_id, customer_id, amount,order_date from orders 
where amount = (select max(amount) from orders);

-- Q10. Using the IN operator with a subquery, find all customers who have placed at least one order. Return
-- customer_id, customer_name, and city, ordered by customer_id.
select customer_id, customer_name,city from customers 
where customer_id in (select customer_id from orders) order by customer_id;

-- Q11. Using the NOT IN operator with a subquery, find all customers who have NEVER placed any order. Return
-- customer_id, customer_name, and city, ordered by customer_id.
select customer_id, customer_name,city from customers 
where customer_id not in (select customer_id from orders) order by customer_id;

-- Q12. Using the IN operator with a subquery on the orders table, find all products that appear in at least one order.
-- Show product_id, product_name, category, and price.
select product_id, product_name, category,price from products
where product_id in (select product_id from orders);

-- Q13. Using the NOT IN operator, find all products that have NEVER appeared in any order. Return product_id,
-- product_name, category, and price.
select product_id, product_name, category,price from products
where product_id not in (select product_id from orders);

-- Q14. Using an IN subquery against the departments table, retrieve the emp_name and salary of all employees who
-- belong to the Finance department. Order by salary descending. (Do not hardcode the department name in the
-- WHERE clause of the outer query — use a subquery to fetch it.)
select emp_name,salary from employees 
where department in (select dept_name from departments where dept_name = "finance") order by salary desc;

-- Q15. Find all employees whose salary is less than the minimum salary of any employee in the Finance department.
-- Return emp_name, department, and salary, ordered by salary descending. (Use a single-row subquery returning MIN
-- salary of Finance.)
select emp_name, department,salary from employees 
where salary < (select min(salary) from employees where department ="finance") order by salary desc;

-- Q16. Find the department with the highest budget from the departments table. Return dept_name, budget, and
-- location. Use a single-row subquery that returns MAX(budget).
select dept_name, budget,location from departments
where budget= (select max(budget) from departments);

-- Q17. Using a subquery with GROUP BY and HAVING, find all customers who have placed exactly 1 order. Return
-- customer_id, customer_name, and city.
select customer_id, customer_name,city from customers 
where customer_id = (select customer_id from orders group by customer_id having count(order_id) = 1); 

-- Q18. Using a subquery with GROUP BY and HAVING, find all customers who have placed 2 or more orders. Return
-- customer_id, customer_name, and city, ordered by customer_id.
select customer_id, customer_name,city from customers 
where customer_id in (select customer_id from orders group by customer_id having count(order_id) >= 2) order by customer_id; 

-- Q19. Find all products whose price is greater than the maximum price of any product in the 'Accessories' category.
-- Use a scalar subquery returning MAX price for Accessories. Return product_name, category, and price ordered by
-- price descending.
select product_name, category,price from products 
where price > (select max(price) from products where category = 'Accessories') order by price desc;
 
--  Q20. Using an IN subquery, find all orders placed by customers who joined in the year 2021. Return order_id,
-- customer_id, amount, and order_date, ordered by order_date.
 select order_id,customer_id, amount,order_date from orders 
 where customer_id in (select customer_id from customers where join_year=2021) order by order_date;


