-- Version 1
select a.name, a.datetime
from animal_ins a
    left join animal_outs b on a.animal_id = b.animal_id
where b.animal_id is null
order by a.datetime
limit 3


-- Version 2
select name, datetime
from animal_ins
where 1=1
    and animal_id not in (select animal_id from animal_outs)
order by datetime
limit 3
