use datatypedb;
create table test10(id int, name varchar(20));
insert into test10 values(1,'abhi'),(2,'shini');
select * from test10;

alter table test10 add column(salary int);
alter table test10 add column(age int default 18);
alter table test10 drop column salary;
alter table test10 rename column age to newage;
alter table test10 add constraint primary key(id);
desc test10;

truncate test10;
select * from test10;

drop table test10;


select database();

create table dush389 as
select actor_id,first_name from sakila.actor;

select * from dush389;

insert into dush389 values(19999,'japan');

set sql_safe_updates=0;
update dush389 set first_name='raj' where actor_id=2;
