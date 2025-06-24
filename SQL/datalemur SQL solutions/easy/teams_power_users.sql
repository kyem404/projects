SELECT sender_id, count(message_id) as message_count FROM messages
where date_part('year',sent_date) = 2022 and date_part('month',sent_date) = 08
group by sender_id
order by count(message_id) desc
limit 2;
