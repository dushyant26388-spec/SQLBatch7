USE sql_practice;

select * from orders;
select * from products;
select * from customers;
select * from employees;
select * from departments;

-- intermidate questions of subquery

-- Q31. Using a correlated subquery, find all employees who earn more than the average salary of their own
-- department. For each qualifying employee, also display their department's average salary (rounded to 2 decimal
-- places). Order by department, then salary descending.

select emp_name,department,salary,
round((select avg(e2.salary) from employees as e2 where e2.department=e1.department),2)
as avg_dept_sal from employees as e1
where salary>(select avg(e2.salary) from employees as e2 where e2.department=e1.department)
order by department,salary desc; 

-- Q32. For every employee, use a correlated subquery to count how many other employees in the same department
-- earn strictly more than them. Display emp_name, department, salary, and this count as 'higher_earners'. Order by
-- department, salary descending.

select e.emp_name, e.department, e.salary,
(select count(*) from employees as e2 
where e2.department=e.department and e2.salary>e.salary) as higher_earners
from employees as e order by department,salary desc ;

-- Q33. Using a correlated subquery inside the WHERE clause, find all customers whose total order spend (sum of all
-- their order amounts) is greater than the average total spend per customer across all ordering customers. Display
-- customer_id, customer_name, and total_spend. Order by total_spend descending. (Compute per-customer total and
-- the overall average both via subqueries — no window functions.)





-- Q34. Using a subquery in the WHERE clause with IN and a GROUP BY / HAVING inside the subquery, find all
-- employees who belong to departments where the average salary of the department is greater than 65,000. Return
-- emp_name, department, and salary, ordered by department and salary descending.

select emp_name, department,salary from employees
where department in (select department from employees group by department having avg(salary) > 65000) 
order by department,salary desc;

-- Q35. For every row in the orders table, use a correlated subquery inside a CASE expression to label each order as
-- 'Above Avg' if its amount is greater than or equal to that customer's own average order amount, and 'Below Avg'
-- otherwise. Show order_id, customer_id, amount, and the label as 'vs_cust_avg'. Order by customer_id, order_id.

select order_id, customer_id, amount,
	case
		when amount >=(select avg(o2.amount) from orders o2 where o2.customer_id=o1.customer_id)
		then 'above avg' 
		else 'below avg'
	end as vs_cust_avg  
from orders o1 order by customer_id,order_id;

-- Q36. Using a correlated subquery, find all products whose price is greater than the average price of other products
-- in the same category. Display product_name, category, price, and the category average (rounded to 2 decimals) as
-- 'cat_avg'. Order by category, price descending.

select p1.product_name, p1.category, p1.price,
round((select avg(p2.price) from products as p2 where p2.category=p1.category),2) as cat_avg from products as p1
where p1.price > (select avg(p2.price) from products as p2 where p2.category=p1.category)
Order by category, price desc; 

-- Q37. Find all employees whose salary is greater than the salary of AT LEAST ONE employee in the Marketing
-- department. Use ANY (or equivalently, > MIN of Marketing salaries). Return emp_name, department, and salary
-- ordered by salary descending. Note: Ivy Turner (56,000) is the lowest-paid Marketing employee — so all employees
-- earning above 56,000 qualify.

select emp_name, department,salary from employees
where salary > any(select salary from employees where department='marketing') order by salary desc;


-- Q38. Find all employees whose salary is less than the salary of EVERY employee in the Finance department. In
-- other words, their salary must be below even the minimum Finance salary (70,000). Use ALL (or < MIN of Finance).
-- Return emp_name, department, and salary ordered by salary descending.

select emp_name, department,salary from employees
where salary < all (select salary from employees where department='finance') order by salary desc;

-- Q39. Find customers who have placed at least one order AND whose every order has status = 'Delivered' (i.e., they
-- have no Cancelled or Pending orders). Use a combination of EXISTS and NOT EXISTS. Return customer_id and
-- customer_name ordered by customer_id.

select customer_id,customer_name from customers as c
where exists (select * from orders as o where o.customer_id=c.customer_id)
and not exists (select * from orders as o where o.customer_id=c.customer_id and o.status in ('cancelled','pending'))
order by customer_id;


-- Q40. Using nested IN subqueries, find all products that were ordered by at least one customer from the city of
-- Mumbai. First find customer_ids from Mumbai, then find product_ids ordered by those customers, then return the
-- product details. Show product_id, product_name, and category, ordered by product_id.

select product_id, product_name,category from products where product_id in
(select product_id from orders where customer_id in (select customer_id from customers where city='mumbai'))
order by product_id;

-- Q41. Find the employee(s) with the second-highest salary in the entire company. Use a subquery that first finds the
-- maximum salary, then an outer query that finds the maximum salary below that value. Return emp_name,
-- department, and salary.

select emp_name,department,salary from employees
where salary=(select max(salary) from employees
where salary < (select max(salary) from employees));

-- Q42. Using NOT EXISTS, find all departments where every single employee earns strictly more than 50,000. (i.e.,
-- there is no employee in that department with salary <= 50,000.) Return just the department name, ordered
-- alphabetically. Note: Leo Harris in HR earns exactly 50,000, so HR does not qualify.

SELECT DISTINCT department FROM employees e1
WHERE NOT EXISTS (SELECT * FROM employees e2 WHERE e2.department = e1.department AND e2.salary <= 50000)
ORDER BY department;

-- Q43. Using a correlated subquery in the WHERE clause, find all customers who have placed orders for at least 2
-- different products (i.e., their orders contain at least 2 distinct product_id values). Return customer_id and
-- customer_name, ordered by customer_id.

SELECT customer_id, customer_name FROM customers c
WHERE (SELECT COUNT(DISTINCT product_id) FROM orders o WHERE o.customer_id = c.customer_id) >= 2
ORDER BY customer_id;

-- Q44. Using a correlated subquery, find all employees whose salary is above the average salary of all employees
-- hired in the same year as them. Show emp_name, department, salary, hire_year, and the year's average (rounded to
-- 2 dp) as 'year_avg'. Order by hire_year, salary descending.

SELECT e1.emp_name,e1.department,e1.salary,e1.hire_year,
       ROUND((SELECT AVG(e2.salary) FROM employees e2 WHERE e2.hire_year = e1.hire_year),2) AS year_avg
FROM employees e1
WHERE e1.salary > (SELECT AVG(e2.salary) FROM employees e2 WHERE e2.hire_year = e1.hire_year)
ORDER BY e1.hire_year, e1.salary DESC;

-- Q45. Using a correlated subquery, find all products whose stock_qty is less than the average stock_qty of all
-- products in the same category. Display product_name, category, stock_qty, and the category average stock rounded
-- to 2 dp as 'cat_avg_stock'. Order by category, stock_qty ascending.

SELECT p1.product_name,p1.category,p1.stock_qty,
ROUND((SELECT AVG(p2.stock_qty) FROM products p2 WHERE p2.category = p1.category),2)AS cat_avg_stock
FROM products p1
WHERE p1.stock_qty < (SELECT AVG(p2.stock_qty) FROM products p2 WHERE p2.category = p1.category)
ORDER BY p1.category, p1.stock_qty ASC;