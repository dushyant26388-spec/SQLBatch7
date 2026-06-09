create database indexdb;
use indexdb;
create table employees(id int, name varchar(50),age int);

insert into employees values(1,'abc',90),(2,'abhi',23),(3,'def',100),
(5,'naina',7899),(6,'shyam',100),(4,'tushar',60);


explain select * from employees where id=2;


select * from employees;
show indexes  from employees;

create index age_indx on employees(age);
explain select * from employees where age=100;


create index comp_indx on employees(age,name); -- compsite index
explain select * from employees where age=100 and name='def';


alter table employees 
add primary key (id);

select * from employees; -- sorted format data because it store data in b-tree/binary tree data structure format

explain select * from employees where id=2;

explain select * from employees where name='tushar';