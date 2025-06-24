SELECT city, count(order_id) FROM trades
join users
on trades.user_id = users.user_id
where status = 'Completed'
group by city
order by count(order_id) desc
limit 3;
