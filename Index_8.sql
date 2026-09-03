use newdb2;


create table test18(id int, name varchar(50));

insert into test18 values(1,'a'),(3,'b'),(2,'c'),(5,'d'),(4,'e');

explain select * from test18 where id =3;

select * from test18;

alter table test18 add primary key(id);

desc test18;
select * from test18;

explain select * from test18 where id =3;

create index name_index on test18(name);
show indexes from test18;
select * from test18;

 

