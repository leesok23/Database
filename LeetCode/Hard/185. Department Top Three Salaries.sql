-- (Version 1)
select b.name as department, a.name as employee, a.salary
from employee a
    join department b on a.departmentid = b.id
where (select count(distinct salary) from employee where salary > a.salary and departmentid = a.departmentid) < 3

    
/*
(Version 2)
Use dense_rank() function because the question is asking top three "unique" salaries in each department
*/
select department, employee, salary
from (
    select b.name as department, a.name as employee, a.salary,
        dense_rank() over (partition by b.name order by a.salary desc) as rk
    from employee a
        join department b on a.departmentid = b.id) c
where rk <= 3
