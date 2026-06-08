select * from sakila.actor where actor_id
between 1 and 3
except -- union, union all, intersect, except this is set operations in sql
select * from sakila.actor where actor_id
in(3,5);


with cte as 
(select 1 as n)

select n+5 from cte
where n < 16;


with recursive cte as 
(select 1 as n
union all

select n+1 from cte
where n < 10)

select * from cte;

use windowsdb;

create table employees3(
emp_id int,
emp_name varchar(50),
manager_id int
);

insert into employees3 values
(1,'Ceo',null),
(2,'John',1),
(3,'Mary',1),
(4,'David',2),
(5,'Lisa',2),
(6,'Tom',4);

select * from employees3;

with recursive cte as
(select emp_id as bid, emp_name as bname,emp_name as hireachy from employees3
where manager_id is null 

union all
select emp.emp_id,emp.emp_name, concat(emp.emp_name, '->',cte.hireachy) as hireachy
from employees3 as emp
join cte where emp.manager_id = cte.bid)

select * from cte;


