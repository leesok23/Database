select round(avg(percent_removal), 2) as average_daily_percent
from (
    select action_date, count(distinct b.post_id) / count(distinct a.post_id) * 100 percent_removal
    from actions a
        left join removals b on a.post_id = b.post_id
    where a.extra = 'spam' and a.action = 'report'
    group by 1
    having count(distinct a.post_id) > 0) temp
