select id, company, salary
from (
    select id, company, salary,
        row_number() over (partition by company order by salary, id) as rn,
        count(*) over (partition by company) as num
    from employee) a
where rn >= num/2 and rn <= num/2+1
