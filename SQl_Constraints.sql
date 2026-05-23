create database const_db;

use const_db;

select database();

-- DDL(data definition language)
create table test1( id int, age int);

-- DML(data manipulation language)
insert into test1 values(101, 32), (101, null);

select * from test1;

-- constraint are the rules which are aaplied to the table colom to prevent inavilid data in the table
create table test2( id int, age int not null);
insert into test2 values(101, 32);

-- not null is a constraint which prevents someone to put null value
insert into test2 values(101, null); -- invalid data entry

create table test3( id int unique, age int not null);
insert into test3 values(101, 32);
select * from test3;
insert into test3 values(102, 32);
insert into test3 values(null, 40);

create table test4(id int default 100, age int); -- defaul helps in if no values is given to the row it will give default value
insert into test4(age) values(20); -- specifically age me values insert krne ke liye
select * from test4;

create table test5( id int primary key, age int not null);
insert into test5 values(80, 23);
insert into test5 values(80, 32);-- will give duplicate error

create table test6( id int , age int , salary int);
insert into test6 values(1,50,5999),(2,40,59990),(1,51,59998),(3,50,59996);
select * from test6;

-- combining two column to make an primary key is call composit key
create table test7( id int , age int , salary int,
primary key(id,age) );
insert into test7 values(1,50,5999),(2,40,59990),(1,51,59998),(3,50,59996);
select * from test7;

desc test7; -- desc is used to describe table.

-- check is a type of constrain which helps insert a specifit amount of value in a row
create table test8( id int , age int check(age>18));
insert into test8 values(1, 23);
insert into test8 values(1, 17); -- will give error coz cant insert age >18 coz of check constraint

create table test9( id int , age int check(age between 18 and 23));
insert into test9 values(1, 22);
insert into test9 values(1, 17);

create table  student1(id int, name varchar(20), cname varchar(20));
insert into student1 values(1,'naina','10'), (2,'abhi','12');

create table class(cname varchar(20) primary key);
insert into class values(10), (9), (8);

-- foreign key constraint
-- parent table
create table s_class(cname varchar(20) primary key);
insert into s_class values(10), (9), (8);

-- child table
create table  student2(id int, name varchar(20), cname varchar(20),
                       foreign key (cname) references s_class(cname));
insert into student2 values(1,'naina','10');
insert into student2 values(1,'naina','12'); -- will give error coz in the parent table there is no 12th class

select * from student2;