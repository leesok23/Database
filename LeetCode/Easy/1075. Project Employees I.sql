select project_id, round(avg(experience_years), 2) as average_years
from project a
    join employee b on a.employee_id = b.employee_id
group by 1
