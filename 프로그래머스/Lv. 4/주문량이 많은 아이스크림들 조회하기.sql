-- Version 1
select coalesce(a.flavor, b.flavor) as flavor
from first_half a
    join july b on a.flavor = b.flavor
group by 1
order by sum(a.total_order)+sum(b.total_order) desc
limit 3


-- Version 2
select flavor
from (
    select flavor, total_order
    from first_half
    union all
    select flavor, total_order
    from july
) temp
group by 1
order by sum(total_order) desc
limit 3
