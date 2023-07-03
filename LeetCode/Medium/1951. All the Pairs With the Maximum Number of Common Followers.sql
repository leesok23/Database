select user1_id, user2_id
from (
    select a.user_id as user1_id, b.user_id as user2_id, rank() over (order by count(*) desc) as rk
    from relations a
        join relations b on a.follower_id = b.follower_id and a.user_id < b.user_id
    group by 1, 2) temp
where rk = 1
