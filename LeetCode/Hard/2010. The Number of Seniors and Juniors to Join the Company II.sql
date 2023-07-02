with cte as (
    select
        employee_id,
        experience,
        sum(salary) over (partition by experience order by salary) as cumsum_salary
    from candidates)

select employee_id
from cte
where experience = 'Senior' and cumsum_salary <= 70000

union

select employee_id
from cte
where experience = 'Junior'
    and cumsum_salary <= (select 70000-ifnull(max(cumsum_salary),0) from cte where experience = 'Senior' and cumsum_salary <= 70000)
