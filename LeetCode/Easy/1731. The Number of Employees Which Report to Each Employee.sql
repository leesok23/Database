select a.reports_to as employee_id, b.name, count(a.reports_to) reports_count, round(avg(a.age)) average_age
from employees a
    join employees b on a.reports_to = b.employee_id
group by 1, 2
order by 1
