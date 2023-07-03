select employee_id, name, a.salary, team_id
from employees a
    join (
        select salary, dense_rank() over (order by salary) as team_id
        from employees
        group by 1
        having count(*) > 1) b on a.salary = b.salary
order by 4, 1
