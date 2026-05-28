select * from mysql.user;
create user ishan identified by '123';

select current_user();
create database testdb4;
use testdb4;

create table emp(id int,name varchar(20));
insert into emp values(20,'abhi'),(21,'naina');

select * from emp;

show grants for ishan;

grant select on testdb4.emp to ishan;
