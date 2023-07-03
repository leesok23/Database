select activity
from (
    select activity, dense_rank() over (order by count(*)) as asc_rank, dense_rank() over (order by count(*) desc) dsc_rank
    from friends
    group by 1) temp
where asc_rank != 1 and dsc_rank != 1
