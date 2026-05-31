USE sql_practice;
select * from orders;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price INT,
    stock_qty INT
);

INSERT INTO products VALUES
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

select * from products;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50),
    join_year INT
);

INSERT INTO customers VALUES
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

select * from orders;
select * from products;
select * from customers;

-- topic 2
-- Q1. Show each customer's name along with the total number of orders they have placed.
select c.customer_name, count(o.order_id) as orders_count 
from customers as c join orders as o 
on c.customer_id=o.customer_id group by c.customer_name; 

-- Q2. List each product name with the total revenue generated from orders.
select p.product_name,sum(o.amount) as total_revenue
from products as p join orders as o
on p.product_id=o.product_id group by p.product_name;

-- Q3. Show each product category with the total quantity in stock.
select category, sum(stock_qty) from products
group by category order by category;

-- Q4.Find customers who have spent more than 3,000 in total, showing their name, city and total spend.
select c.customer_name,c.city,sum(o.amount) as total_spend
from customers as c join orders as o
on c.customer_id=o.customer_id group by c.customer_name,c.city having total_spend > 3000
order by total_spend desc;

-- Q5. For each product category, find the average order amount and the number of distinct customers who
-- ordered products in that category.
select p.category,avg(o.amount) as avg_amount,count(distinct o.customer_id) as distinct_customer
from products as p join orders as o on p.product_id=o.product_id
group by p.category;

select * from employees;

-- topic 3
-- Q1. List every employee along with their manager's name. Employees with no manager should still appear
-- (show NULL or 'No Manager').
select e.emp_name,ifnull(m.emp_name,'no manager') as manager_name
from employees as e left join employees as m on e.manager_id=m.emp_id;

-- Q2. Show only those employees whose salary is higher than their manager's salary.
select e.emp_name,e.salary,m.emp_name,m.salary
from employees as e join employees as m on e.manager_id=m.emp_id
where e.salary > m.salary;

-- Q3. List all employees who are managed by 'Alice Johnson', showing the employee name and their
-- department.
select e.emp_name,e.department from employees as e join employees as m
on e.manager_id=m.emp_id where m.emp_name='alice johnson';

-- Q4. For each manager, show their name, department, and the average salary of their direct reports. Only
-- include managers who have at least 3 direct reports.
select m.emp_name,m.department,count(*) as team_size,avg(e.salary)
from employees as m join employees as e on e.manager_id=m.emp_id group by m.emp_name,m.department
having count(*)>=3;

-- Q5. Find pairs of employees who work in the same department and earn within 5,000 of each other (show
-- each pair only once, no self-pairs).
select ;






-- topic 4

select * from employees;
select * from products;
select * from orders;

-- Q1. Find all employees who earn more than the average salary of all employees.
SELECT emp_name,department,salary FROM employees
WHERE salary >(SELECT AVG(salary)FROM employees);

-- Q2. Show the details of the employee who earns the highest salary in the company.
select * from employees where salary = (select max(salary) from employees);

-- Q3. List all products whose price is greater than the average price of all products in the 'Electronics'
-- category.
SELECT * fROM products WHERE price >(SELECT AVG(price)FROM products WHERE category = 'Electronics');

-- Q4. Find all employees in the same department as the employee with the highest salary. Exclude that
-- top-earner from the results.
