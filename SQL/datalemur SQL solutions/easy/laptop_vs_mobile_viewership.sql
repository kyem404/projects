select 
sum(
case device_type
  when 'laptop' then 1
  else 0
end 
)
as laptop_reviews,
sum(
case device_type
  when 'phone' then 1
  when 'tablet' then 1
  else 0
end 
)
as mobile_views
from viewership
