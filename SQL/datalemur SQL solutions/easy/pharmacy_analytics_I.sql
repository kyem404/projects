SELECT drug,
round(total_sales::decimal - cogs::decimal,2) as total_profit
FROM pharmacy_sales
order by total_profit desc
limit 3;
