-- 22nd may - Windows

create database rjdb;

use rjdb;

CREATE TABLE sales (
    id INT,
    sale_date DATE,
    amount INT
);


INSERT INTO sales VALUES
(1, '2026-01-01', 100),
(2, '2026-01-02', 200),
(3, '2026-01-03', 300),
(4, '2026-01-04', 400),
(5, '2026-01-05', 500);

select * from sales;

select *, lag(sale_date,2) over() from sales;

select *, lead(sale_date,1) over() from sales;

select *, lead(sale_date,1) over(order by amount desc) from sales;

-- rows between 
select *, sum(amount) over(rows between unbounded preceding and current row)
from sales;

select *, sum(amount) over(rows between 2 preceding and current row)
from sales;

select *, sum(amount) over(rows between unbounded preceding and 1 following)
from sales;

select id,sale_date,amount,sum(amount) over(order by sale_date rows between
current row and 1 following) as current__next_sum from sales;

