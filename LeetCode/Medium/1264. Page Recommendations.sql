select distinct page_id as recommended_page
from likes a
    join friendship b on (a.user_id = b.user1_id or a.user_id = b.user2_id) and (user1_id = 1 or user2_id = 1)
where page_id not in (select page_id from likes where user_id = 1)
