USE subquery_practice;

select * from employees;
select * from orders;
select * from products;
select * from customers;
select * from departments;



-- Q21. Using EXISTS, find all employees who are managers (i.e., at least one other employee has their emp_id as
-- manager_id). Return emp_id, emp_name, and department, ordered by emp_name.
select e.emp_id, e.emp_name,e.department from employees as e
where exists (select 1 from employees as e2 where e2.manager_id= e.emp_id) order by e.emp_name;


-- Q22. Using NOT EXISTS, find all employees who are NOT managers — meaning no other employee lists them as
-- their manager_id. Return emp_id, emp_name, and department, ordered by emp_id.
select e.emp_id, e.emp_name,e.department from employees as e
where not exists (select 1 from employees as e2 where e2.manager_id= e.emp_id) order by e.emp_id;

-- Q23. Using EXISTS with a correlated subquery on the orders table, find all customers who have placed at least one
-- order. Return customer_id, customer_name, and city, ordered by customer_id.
select  customer_id,customer_name,city from customers as c 
where exists (select 1 from orders as o where o.customer_id = c.customer_id) order by customer_id;

-- Q24. Using NOT EXISTS, find all customers who have never placed any order. Return customer_id, customer_name,
-- and city, ordered by customer_id. 
select customer_id, customer_name,city from customers as c
where not exists (select 1 from orders as o where o.customer_id = c.customer_id) order by customer_id;

-- Q25. Using EXISTS with a correlated subquery on the orders table, find all products that appear in at least one
-- order. Return product_id, product_name, and category, ordered by product_id.
select product_id, product_name,category from products as p 
where exists (select 1 from orders as o where o.product_id=p.product_id) order by product_id;

-- Q26. Find all employees (excluding emp_id 105 — Eva Green herself) who work in the same department as emp_id
-- 105. Use a single-row subquery to get Eva Green's department. Return emp_name, department, and salary ordered
-- by salary descending.
select emp_name, department,salary from employees 
where department=(select department from employees where emp_name='eva green') and emp_name!='eva green' order by salary desc;

-- Q27. Find the order_id, customer_id, amount, and order_date of the most recently placed order (the order with
-- the latest order_date in the table). Use a single-row subquery returning MAX(order_date).
select order_id, customer_id, amount,order_date from orders
where order_date =(select max(order_date) from orders) ;

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







