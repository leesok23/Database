select username, activity, startDate, endDate
from (
    select
        *,
        rank() over (partition by username order by startDate desc) as rk,
        count(*) over (partition by username) count_name
    from useractivity) a
where rk = 2 or count_name = 1
