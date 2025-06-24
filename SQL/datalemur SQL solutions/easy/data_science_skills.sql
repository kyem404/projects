SELECT candidate_id FROM candidates
where skill in('Python','Tableau','PostgreSQL')
group by candidate_id
limit 1;
