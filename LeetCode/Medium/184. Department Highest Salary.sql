# Version 1
select department, employee, salary
from (
    select b.name department, a.name employee, salary,
        rank() over (partition by b.name order by salary desc) rk
    from employee a
        left join department b on a.departmentid = b.id) c
where rk = 1


# Version 2
select b.name department, a.name employee, salary
from employee a
    left join department b on a.departmentid = b.id
where 1 > (select count(distinct salary) from employee where salary > a.salary and departmentid = a.departmentid)
