select name, count(*) as count
from animal_ins
where name is not null
group by 1
having count(*)>1
order by 1
