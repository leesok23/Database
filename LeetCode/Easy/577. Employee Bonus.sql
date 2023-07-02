select name, bonus
from employee a
    left join bonus b on a.empid = b.empid
where bonus < 1000 or bonus is null
