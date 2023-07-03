select round(ifnull(avg(num_sessions),0), 2) as average_sessions_per_user
from (
    select user_id, count(distinct session_id) num_sessions
    from activity
    where datediff('2019-07-27', activity_date) between 0 and 29
    group by 1) temp
