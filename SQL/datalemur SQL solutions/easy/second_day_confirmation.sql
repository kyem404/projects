select user_id from 
(
SELECT 
user_id, 
emails.email_id, 
signup_date, 
action_date, 
(action_date::date - signup_date::date) 
FROM emails
join texts
on emails.email_id = texts.email_id
where (action_date::date - signup_date::date) = 1
)
as users_not_confirmed;
