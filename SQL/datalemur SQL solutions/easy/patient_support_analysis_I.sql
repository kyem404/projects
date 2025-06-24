select count(policy_holder_id)
from 
(
SELECT
policy_holder_id,
count(case_id) as nr_calls
FROM callers
group by policy_holder_id
having count(case_id) >= 3
) as a;
