select activity_date day, count(distinct user_id) active_users
from activity
where datediff('2019-07-27', activity_date) between 0 and 29
group by 1
