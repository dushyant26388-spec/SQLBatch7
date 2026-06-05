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