select project_id
from (
    select project_id, rank() over (order by count(*) desc) rk
    from project
    group by 1) temp
where rk = 1
