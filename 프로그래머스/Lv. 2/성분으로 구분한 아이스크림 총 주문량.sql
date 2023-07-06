select ingredient_type, sum(total_order) as total_order
from first_half a
    join icecream_info b on a.flavor = b.flavor
group by 1
order by 2
