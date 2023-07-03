select employee_id, department_id
from (
    select *, count(employee_id) over (partition by employee_id) count_employee
    from employee) temp
where primary_flag = 'Y' or count_employee=1
