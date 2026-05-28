create database rajdb;
use rajdb;
create table raj45(id int);
insert into raj45 values(10);
select * from raj45;

start transaction;
insert into raj45 values(100),(99);
select * from raj45;
commit;

start transaction;
update raj45 set id=500;
select * from raj45;
rollback;

start transaction;
insert into raj45 values(10),(11),(56),(68);
set sql_safe_updates=0;
delete from raj45 where id=10;

select  * from raj45;
commit;
rollback;

start transaction;
insert into raj45 values(768),(500),(400);
select * from raj45;

savepoint raj45_savepoint_ins;
update raj45 set id=1000;
rollback to raj45_savepoint_ins; -- rollback to savepoint to revert upto specific upto specific point
