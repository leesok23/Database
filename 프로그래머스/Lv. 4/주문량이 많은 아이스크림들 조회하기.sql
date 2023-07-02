select coalesce(a.flavor, b.flavor) as flavor
from first_half a
    join july b on a.flavor = b.flavor
group by 1
order by sum(a.total_order)+sum(b.total_order) desc
limit 3
