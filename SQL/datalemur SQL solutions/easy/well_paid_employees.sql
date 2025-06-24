SELECT e_e.name as employee_name,
e_e.employee_id as employee_id
FROM employee as e_m
join employee as e_e
on e_m.employee_id = e_e.manager_id
where e_e.salary > e_m.salary;
