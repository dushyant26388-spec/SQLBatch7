USE sql_practice;

select * from orders;
select * from products;
select * from customers;
select * from employees;
select * from departments;

-- Q1.Q1. Find the names, departments, and salaries of all employees whose salary is greater than the average salary of
-- all employees in the company. The company-wide average salary should be computed inside a subquery.

select emp_name,department,salary from employees 
where salary > (select avg(salary) from employees) order by salary desc; 

-- Q2. Display the emp_id, emp_name, department, and salary of the single highest-paid employee in the entire
-- company. Use a subquery that returns the maximum salary, and filter the main query to match it.
select emp_id, emp_name, department,salary from employees
where salary = (select max(salary) from employees);

-- Q3. Display the emp_id, emp_name, department, and salary of the employee with the lowest salary in the entire
-- company.
select emp_id, emp_name, department,salary from employees
where salary = (select min(salary) from employees);

-- Q4. Find all employees (other than Rachel King herself) who were hired in the same year as Rachel King. Return
-- their emp_name, department, and hire_year. Use a single-row subquery to find Rachel King's hire year.
select emp_name,department,hire_year from employees 
where hire_year = (select hire_year from employees where emp_name ='rachel king') and emp_name!='rachel king';

-- Q5. List all products whose price is greater than the average price across all products in the entire products table.
-- Show product_name, category, and price, ordered by price descending.
select product_name,category,price from products
where price > (select avg(price) from products) order by price desc;

-- Q6. Retrieve the product_id, product_name, category, and price of the single most expensive product in the entire
-- products table.
select product_id, product_name, category,price from products
where price =(select max(price) from products);

-- Q7. Retrieve the product_id, product_name, category, and price of the cheapest product in the entire products
-- table.
select product_id, product_name, category,price from products
where price =(select min(price) from products);

-- Q8. List all orders whose amount is greater than the average order amount across all orders in the orders table.
-- Show order_id, customer_id, and amount, ordered by amount descending.
select order_id,customer_id,amount from orders 
where amount >(select avg(amount) from orders) order by amount desc;

-- Q9.Find the order_id, customer_id, amount, and order_date of the single most expensive order ever placed (the
-- order with the highest amount in the entire orders table).
select order_id,customer_id, amount,order_date from orders 
 where amount = (select max(amount) from orders);
 
-- Q10. Using the IN operator with a subquery, find all customers who have placed at least one order. Return
-- customer_id, customer_name, and city, ordered by customer_id.
select customer_id, customer_name,city from customers 
where customer_id in (select customer_id from orders);

-- Q11.Using the NOT IN operator with a subquery, find all customers who have NEVER placed any order. Return
-- customer_id, customer_name, and city, ordered by customer_id.
select customer_id, customer_name,city from customers 
where customer_id not in (select customer_id from orders);

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
select emp_name, salary from employees 
where department in (select dept_name from departments where dept_name='finance') order by salary desc;

-- Q15. Find all employees whose salary is less than the minimum salary of any employee in the Finance department.
-- Return emp_name, department, and salary, ordered by salary descending. (Use a single-row subquery returning MIN
-- salary of Finance.)
SELECT emp_name,department,salary FROM employees
WHERE salary < (SELECT MIN(salary) FROM employees WHERE department = 'Finance')
ORDER BY salary DESC;

-- Q16.
SELECT dept_name,Budget,location FROM departments
WHERE budget = (SELECT MAX(budget) FROM departments);

-- Q17.
SELECT customer_id,customer_name,city FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders GROUP BY customer_id HAVING COUNT(*) = 1);

-- Q18.
SELECT customer_id,customer_name,city FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders GROUP BY customer_id HAVING COUNT(*) >= 2)
ORDER BY customer_id;

-- Q19.
SELECT product_name,category,price FROM products
WHERE price > (SELECT MAX(price) FROM products WHERE category = 'Accessories')
ORDER BY price DESC;

-- Q20
SELECT order_id,customer_id,amount,order_date FROM orders
WHERE customer_id IN (SELECT customer_id FROM customers WHERE EXTRACT(YEAR FROM join_year) = 2021)
ORDER BY order_date;

-- Q21. Using EXISTS, find all employees who are managers (i.e., at least one other employee has their emp_id as
-- manager_id). Return emp_id, emp_name, and department, ordered by emp_name.

select emp_id, emp_name,department from employees as e 
where exists (select * from employees as e2 where e2.manager_id=e.emp_id) order by emp_name;

-- Q22. Using NOT EXISTS, find all employees who are NOT managers — meaning no other employee lists them as
-- their manager_id. Return emp_id, emp_name, and department, ordered by emp_id.

select emp_id, emp_name,department from employees as e 
where not exists (select * from employees as e2 where e2.manager_id=e.emp_id) order by emp_name;

-- Q23. Using EXISTS with a correlated subquery on the orders table, find all customers who have placed at least one
-- order. Return customer_id, customer_name, and city, ordered by customer_id.

select customer_id, customer_name,city from customers as c
where exists (select * from orders as o where o.customer_id=c.customer_id) order by customer_id;

-- Q24. Using NOT EXISTS, find all customers who have never placed any order. Return customer_id, customer_name,
-- and city, ordered by customer_id.
select customer_id, customer_name,city from customers as c
where not exists (select * from orders as o where o.customer_id=c.customer_id) order by customer_id;

-- Q25. Using EXISTS with a correlated subquery on the orders table, find all products that appear in at least one
-- order. Return product_id, product_name, and category, ordered by product_id.
select product_id, product_name,category from products as p
where exists (select * from orders as o where o.product_id=p.product_id) order by product_id;

-- Q26. Find all employees (excluding emp_id 105 — Eva Green herself) who work in the same department as emp_id
-- 105. Use a single-row subquery to get Eva Green's department. Return emp_name, department, and salary ordered
-- by salary descending.
select emp_name, department,salary from employees
where department= (select department from employees where emp_id=105) and emp_id != 105
order by salary desc; 

-- Q27. Find the order_id, customer_id, amount, and order_date of the most recently placed order (the order with
-- the latest order_date in the table). Use a single-row subquery returning MAX(order_date).
select order_id, customer_id, amount,order_date from orders
where order_date = (select max(order_date) from orders);

-- Q28. Find the order_id, customer_id, amount, and order_date of the earliest order ever placed (the order with the
-- minimum order_date). Use a single-row subquery.
select order_id, customer_id, amount,order_date from orders 
where order_date =(select min(order_date) from orders);

-- Q29. Find all employees whose salary is greater than the salary of EVERY employee in the HR department. In other
-- words, their salary must exceed even the highest-paid HR employee. Return emp_name, department, and salary
-- ordered by salary descending. (Use a scalar subquery returning MAX salary of HR.)
select emp_name, department,salary from employees
where salary > (select max(salary) from employees where department='hr') order by salary desc;

-- Q30. Among orders with status = 'Delivered', find those whose amount is greater than the average amount of all
-- Delivered orders. Use a single-row scalar subquery to compute the average of Delivered orders. Return order_id,
-- customer_id, amount, and status ordered by amount descending.

select order_id,customer_id, amount,status from orders
where amount > (select avg(amount) from orders where status='delivered') and status = 'delivered'
order by amount desc;