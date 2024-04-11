select
    a.id
    , count(b.id) as child_count
from ecoli_data a
    left outer join ecoli_data b on a.id = b.parent_id
group by 1
order by 1
