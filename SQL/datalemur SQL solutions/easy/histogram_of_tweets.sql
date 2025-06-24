select count(user_id) as bucket, twt_number 
from (
select user_id, count(msg) as twt_number from tweets
where tweet_date between '12/31/2021' and '01/31/2023'
group by user_id
) as t
group by twt_number
order by bucket asc;
