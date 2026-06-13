USE sql_practice;

select * from orders;
select * from products;
select * from customers;
select * from employees;
select * from departments;

-- Q46. Find all employees whose salary is among the top 3 distinct salary values in the company. For example, if the
-- top 3 distinct salaries are 82000, 80000, and 78000, return all employees earning any of those values. Use a subquery
-- with LIMIT or a nested approach — no window functions.
select emp_name,department,salary from employees 
where salary in(select salary from (select distinct salary from employees order by salary desc limit 3) as top_salaries)
order by salary desc;

-- Q47. Find all customers (who have placed at least one order) where every single one of their orders has an amount
-- strictly greater than 1,000. Customers with any order at or below 1,000 must be excluded. Use EXISTS and NOT
-- EXISTS. Return customer_id and customer_name, ordered by customer_id.

select customer_id,customer_name from customers as c 
where exists (select * from orders as o where o.customer_id=c.customer_id)
and not exists (select * from orders as o where o.customer_id=c.customer_id and amount <=1000)
order by customer_id;

-- Q48. For each department, find the employee whose salary is closest to that department's average salary
-- (minimum absolute difference). If two employees are equally close, both should appear. Show emp_name,
-- department, salary, dept_avg (rounded to 2 dp), and the difference (diff). Order by department.

with dept_avg as 
(select department,avg(salary) as dsalary from employees group by department),

employee_dept_avg as
(select emp_name,e.department,e.salary,
dept_avg.dsalary from employees as e join dept_avg where e.department=dept_avg.department),

absolute_salary as
(select *,abs(round((salary-dsalary),2) )as diff from employee_dept_avg)

select * from absolute_salary as eout 
where diff =(select min(diff) from absolute_salary as e2 where e2.department=eout.department) order by department;


-- Q49. Find all customers (other than customer 201) who have ordered every product that customer 201 has
-- ordered. Customer 201 (Aarav Mehta) has ordered product_ids 301, 302, and 304. A candidate customer must have
-- ordered all three. Use a NOT EXISTS / EXCEPT approach. Return customer_id and customer_name ordered by
-- customer_id. (With this dataset, the expected result is an empty set.)

