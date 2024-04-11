select distinct c.id
from ecoli_data a
    left outer join ecoli_data b on a.id = b.parent_id
    left outer join ecoli_data c on b.id = c.parent_id
where 1=1
    and a.parent_id is null
    and c.id is not null
order by 1
