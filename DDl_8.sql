create database testdb;
use testdb;

create table testdb.employee1(id int);
select * from testdb.employee1;

-- ddl alter
alter table testdb.employee1 add column name varchar(20);
alter table testdb.employee1 drop column id;

 select * from testdb.employee1;
 
 desc testdb.employee1;
alter table testdb.employee1 modify column name int;

alter table testdb.employee1 add column empid int;

alter table testdb.employee1 add constraint unique(name);

alter table testdb.employee1 modify column empid int not null;
desc testdb.employee1;

alter table testdb.employee1 add primary key(empid);

alter table testdb.employee1 rename column empid to  id;
alter table testdb.employee1 rename to employee2;

desc testdb.employee2;

select * from testdb.employee2;
insert into testdb.employee2 values(100,80);

truncate testdb.employee2;
select * from testdb.employee2;

alter table testdb.employee2 drop constraint name;

set sql_safe_updates=0;

insert into testdb.employee2 values (10,999),(13,200),(11,899),(12,5738),(10,10910);
update testdb.employee2 set name ='899';


update testdb.employee2 set name='7123' where id =999;
select * from testdb.employee2;

delete from testdb.employee2 where name =10;