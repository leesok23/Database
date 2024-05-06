select distinct a.id, a.email, a.first_name, a.last_name
from developers a
    inner join skillcodes b on (a.skill_code & b.code) = b.code
where 1=1
    and b.name in ('Python','C#')
order by 1
