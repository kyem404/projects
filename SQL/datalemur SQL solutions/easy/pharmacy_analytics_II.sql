select
manufacturer,
count(drug) as drug_count,
abs(sum(profit_loss)) as total_loss
from 
(
select manufacturer,
drug,
total_sales-cogs as profit_loss
from pharmacy_sales
where total_sales - cogs <= 0
) as a 
group by manufacturer
order by total_loss desc;
