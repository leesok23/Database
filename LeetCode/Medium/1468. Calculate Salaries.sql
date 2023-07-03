select a.company_id, employee_id, employee_name, round(a.salary * (1-b.tax_rate)) as salary
from salaries a
    join (
        select
            company_id,
            case when max(salary) < 1000 then 0
                when max(salary) between 1000 and 10000 then 0.24
                else 0.49 end as tax_rate
        from salaries
        group by 1) b on a.company_id = b.company_id
