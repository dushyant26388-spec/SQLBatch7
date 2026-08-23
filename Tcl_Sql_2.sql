use newdb;

create table departments7(
dept_id int primary key,
dept_name varchar(50),
location varchar(50)
);

insert into departments7 values
(101,'hr','delhi'),
(102,'IT','bangalore');

start transaction;
insert into departments7 values
(103,'asdf','jaipur');
commit;
select * from departments7;

start transaction;
delete from departments7;
rollback;
select * from departments7;


start transaction;
insert into departments7 values (105,'asdfsd','jaipbjsbjb');
savepoint departments7_insert_chk1; -- creating a reference point

delete from departments7 where dept_id=103;

rollback to departments7_insert_chk1 ; -- revert to specific point
select * from departments7;




