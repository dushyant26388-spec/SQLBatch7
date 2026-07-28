create database corr_db;
use corr_db;

CREATE TABLE employee_c(id int,name varchar(20),salary int);

insert into employee_c values(1,'a',100),(2,'b',250),(3,'c',400),(4,'d',380);

select * from employee_c;

select * from employee_c where salary=(select max(salary) from employee_c where name='b');

insert into employee_c values(5,'aman',250);

select * from employee_c where salary=(select salary from employee_c where name='b');

use world;
select * from city;

-- get the name of city where the district of the city is same for the city abu dabi
select name from city where district =(select district from city where name ="abu dhabi");

-- get all the columns of the city table where the population is the max
 select * from city where population =(select max(population) from city);
 
 -- get district and name of the city where the country code is same for herat
select district,name from city 
where countrycode=( select countrycode from city where name ="herat");

-- get the district,city,population for all countries where amsterdam is present and sort the data by 
select district,name,population from city where name=(select name from city where name ="amsterdam");










