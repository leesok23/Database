select
    a.id as p1,
    b.id as p2,
    case when a.x_value = b.x_value or a.y_value = b.y_value then 0
        else abs(a.x_value - b.x_value) * abs(a.y_value - b.y_value)
        end as area
from points a
    join points b on a.id < b.id
where abs(a.x_value - b.x_value) * abs(a.y_value - b.y_value) > 0
order by 3 desc, 1, 2
