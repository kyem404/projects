select cast(substring(cast(submit_date as varchar),6,2) as integer) as mth, 
product_id as product, 
round(avg(stars),2) as avg_stars
from reviews
group by product_id, cast(substring(cast(submit_date as varchar),6,2) as integer)
order by cast(substring(cast(submit_date as varchar),6,2) as integer), product_id;
