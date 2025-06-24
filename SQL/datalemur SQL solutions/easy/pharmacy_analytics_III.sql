SELECT
manufacturer,
'$' || round(sum(total_sales)/1000000) || ' million' as sales
FROM pharmacy_sales
group by manufacturer
order by sum(total_sales) desc, manufacturer;
