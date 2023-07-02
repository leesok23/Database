select a.id, a.month, sum(b.salary) as salary
from employee a
    join employee b on a.id = b.id and a.month in (b.month, b.month+1, b.month+2)
where (a.id, a.month) not in (select id, max(month) from employee group by 1)
group by 1, 2
order by 1, 2 desc
