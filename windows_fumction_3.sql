USE subquery_practice;

select * from orders;

select *, lag(amount,1,0) over(partition by customer_id order by order_date) as prev2,
lag(amount,2,0) over(partition by customer_id order by order_date) as prev3 from orders;

select *, lag(amount,1,0) over(partition by customer_id order by order_date) as prev2,
lag(amount,2,0) over(partition by customer_id order by order_date) as prev3 ,
amount + lag(amount,1,0) over(partition by customer_id order by order_date) +
lag(amount,2,0) over(partition by customer_id order by order_date) from orders;






