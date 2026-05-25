create database if not exists datatypedb;
use datatypedb;

-- numeric

create table test3(salary float,salary2 double);
insert into test3 values(1989.954514,1989.954514);
select * from test3;

create table test4(price double(6,2)); -- total is 6,2 is decimal value
insert into test4 values(0.7832645); -- only 2 decimal value
insert into test4 values(44.7832645);
insert into test4 values(4453.7832645);
insert into test4 values(4453);
insert into test4 values(44531);
select * from test4;

create table test5(countrycode char(3));
insert into test5 values("IND");
insert into test5 values("INDIA"); -- error beacuse limit is set on char(3)
insert into test5 values("SNG       ");
select *, char_length(countrycode) from test5;

create table test6(countrycode varchar(3));
insert into test6 values("IND");
insert into test6 values("INDIA"); -- error 
insert into test6 values("SNG       ");
insert into test6 values("h       ");
select *, char_length(countrycode) from test6;
