select animal_type, count(*) as count
from animal_ins
where animal_type in ('Dog','Cat')
group by 1
order by 1
