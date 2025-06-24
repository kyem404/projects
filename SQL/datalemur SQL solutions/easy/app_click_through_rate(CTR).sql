SELECT app_id,
round(
sum(
  case 
    when date_part('year',timestamp) = '2022'
    and event_type = 'click'
    then 1
  else 0
      end
)*100.0 / 
sum(
  case 
    when date_part('year',timestamp) = '2022'
    and event_type = 'impression' 
    then 1
  else 0
      end 
),
2)
as ctr
from events
group by app_id;
