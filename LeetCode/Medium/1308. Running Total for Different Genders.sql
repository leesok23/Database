select a.gender, a.day, sum(b.score_points) as total
from scores a
    left join scores b on a.gender = b.gender and a.day >= b.day
group by 1, 2
order by 1, 2
