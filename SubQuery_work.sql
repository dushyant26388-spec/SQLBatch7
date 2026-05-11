use  sakila;
select * from film;

select title,rental_rate from film
where rental;

-- Q1
select min(rental_rate) from film; -- "use for find min rental rate"

select film_id,title from film 
where rental_rate = (select min(rental_rate) from film);


-- Q2
select avg(rental_duration) from film; -- 'for find rental duration'

select film_id,title,rental_duration from film 
where rental_duration > (select avg(rental_duration) from film);


-- Q3
select release_year from film where title = 'alone trip'; -- 'find release year'
select rating from film where title = 'apollo teen'; -- 'find rating'

select * from film 
where release_year = (select release_year from film where title = 'alone trip')
and rating = (select rating from film where title = 'apollo teen');

