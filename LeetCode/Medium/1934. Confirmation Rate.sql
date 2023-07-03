select a.user_id, round(coalesce(sum(b.action='confirmed')/count(b.action),0), 2) as confirmation_rate
from signups a
    left join confirmations b on a.user_id = b.user_id
group by 1
