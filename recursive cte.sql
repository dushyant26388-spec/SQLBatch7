use newdb2;

create table city3 as select id,name, population from world;

with recursive cte as 
(select 10 as num

union
select num+1 from cte
where num<14
)
select * from cte;


create table employee(
emp_id int,
emp_name varchar(100),
manager_id int
);

insert into employee values
(1,'john',null),
(2,'alice',null),
(3,'bob',null),
(4,'david',null),
(5,'sarah',null),
(6,'mike',null),
(1,'tom',null);


with tempcte as
(select *, emp_name as hireachy from employee where manager_id is null)

select *,emp_name from employees as e join tempcte
on e.manager_id=tempcte.emp_id where e.emp_id=2;


