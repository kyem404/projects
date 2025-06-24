SELECT
user_id,
spend,
transaction_date
from 
(
  select 
  user_id,
  spend,
  transaction_date,
  row_number() over (
    partition by user_id order by transaction_date) 
    as row_num from transactions
) 
as trans_num
where row_num = 3;
