SELECT distinct pages.page_id FROM pages
left join page_likes
on page_likes.page_id = pages.page_id
where user_id is null
order by page_id desc;
