select c.employee_id
from employees a
    join employees b on a.employee_id = b.manager_id
    join employees c on b.employee_id = c.manager_id
where a.manager_id = 1 and c.employee_id != 1
