with cte as (
    select '[0-5>' as bin, 0 as time1, 5*60 as time2
    union
    select '[5-10>' as bin, 5*60 as time1, 10*60 as time2
    union
    select '[10-15>' as bin, 10*60 as time1, 15*60 as time2
    union
    select '15 or more' as bin, 15*60 as time1, 10000 as time2)

select bin, count(session_id) as total
from cte a
    left join sessions b on b.duration >= a.time1 and b.duration < a.time2
group by 1
