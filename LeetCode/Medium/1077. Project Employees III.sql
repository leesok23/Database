select project_id, employee_id
from (
    select project_id, a.employee_id, rank() over (partition by project_id order by experience_years desc) rk
    from project a
    join employee b on a.employee_id = b.employee_id) temp
where rk = 1
