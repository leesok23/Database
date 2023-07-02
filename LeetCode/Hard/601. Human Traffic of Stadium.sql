select distinct a.id, a.visit_date, a.people
from stadium a, stadium b, stadium c
where a.people >= 100 and b.people >= 100 and c.people >= 100
    and (abs(a.id - b.id) = 1 and abs(a.id - c.id) = 2 and abs(b.id - c.id) = 1)
order by 2
