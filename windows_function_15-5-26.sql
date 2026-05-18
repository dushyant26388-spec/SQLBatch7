use subquerydb;
select * from employees;

-- window functions
-- over
select emp_id,name,salary,avg(salary) over() from employees;

select emp_id,name,salary,max(salary) over(),
avg(salary) over() from employees;

select emp_id,name,salary,max(salary) over(), salary-avg(salary) over()
from employees;

select emp_id,name,salary,count(*) over(),max(salary) over(),min(salary) over(),
avg(salary) over() from employees;

select emp_id,name,salary,sum(salary) over(),
concat(round(salary/sum(salary) over()*100),'%')from employees;

select emp_id,name,salary,sum(salary) over(order by salary) from employees;

select emp_id,name,department,salary,sum(salary) over(order by emp_id desc)
from employees;

select emp_id,name,department,salary,sum(salary) over(order by department)
from employees;

-- partition by 
select * from employees;

select *,sum(salary) over(partition by department),
sum(salary) over() from employees;

select *,sum(salary) over(partition by name)
from employees;

select *,sum(salary) over(partition by manager_id)
from employees;

select *,sum(salary) over(partition by department order by salary)
from employees;

select name,department,salary,sum(salary) over(partition by name),
(salary / sum(salary) over(partition by name))*100 from employees;