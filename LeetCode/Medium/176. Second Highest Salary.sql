-- (Version 1) Use dense_rank() function
select if(count(*) = 0, null, salary) secondhighestsalary
from (
    select salary, dense_rank() over (order by salary desc) rk
    from employee
) a
where rk = 2


-- (Version 2) 
select if(count(*)>0,salary,null) secondhighestsalary
from employee a
where salary < (select max(salary) from employee)
    and 2 > (select count(distinct salary) from employee where salary > a.salary)


-- (Version 3)
select max(salary) secondhighestsalary
from employee
where salary != (select max(salary) from employee)
