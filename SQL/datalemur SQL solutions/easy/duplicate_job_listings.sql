select count(job_count) as duplicate_companies 
from (
SELECT 
company_id,
title,
description,
count(job_id) as job_count
FROM job_listings
group by title, description, company_id
having count(job_id) >= 2) 
as job_duplicates;
