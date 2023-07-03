select emp_id, firstname, lastname, max(salary) as salary, department_id
from salary
group by 1, 2, 3, 5
order by 1
