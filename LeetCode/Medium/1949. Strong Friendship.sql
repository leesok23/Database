with cte as (
    select user1_id, user2_id from friendship
    
    union all
    
    select user2_id as user1_id, user1_id as user2_id from friendship)

select a.user1_id, b.user1_id as user2_id, count(*) as common_friend
from cte a
    join cte b on a.user2_id = b.user2_id
where a.user1_id < b.user1_id
    and (a.user1_id, b.user1_id) in (select * from cte)
group by 1, 2
having count(*) >= 3
