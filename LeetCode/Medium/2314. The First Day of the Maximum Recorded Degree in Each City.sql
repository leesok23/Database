select a.city_id, min(a.day) as day, a.degree
from weather a
    join (
        select city_id, max(degree) as degree
        from weather
        group by 1) b on a.city_id = b.city_id and a.degree = b.degree
group by 1, 3
order by 1
