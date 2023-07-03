select a.name
from employee a
    join employee b on a.id = b.managerId
group by 1
having count(*) >= 5
