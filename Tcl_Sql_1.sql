create database tcldb2;

use tcldb2;

create table tcldb2.test(id int, name varchar(20));
insert into tcldb2.test values (18,'abhinav');

select @@autocommit; -- by default autocommit is 1 mean file will be save automatically

start transaction;
insert into tcldb2.test values (19,'raj');
select * from test;  -- two rows here 
commit; -- you saved the changes in database

start transaction;
insert into tcldb2.test values (20,'japan');
insert into tcldb2.test values (21,'north korea');
rollback; -- to revert the above two line inserted  
select * from test;


start transaction;
insert into tcldb2.test values (21,'ajskdhf');
set sql_safe_updates = 0; --  using this command for allow update command 
update tcldb2.test set name='abcabc';
rollback; -- to revert the above two line inserted  
select * from test;



insert into tcldb2.test values (21,'ujjwal');
delete from tcldb2.test;
select * from test;
rollback;

