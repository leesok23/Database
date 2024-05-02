-- Version 1
select food_type, rest_id, rest_name, favorites
from rest_info
where (food_type, favorites) in (
    select food_type, max(favorites)
    from rest_info
    group by 1)
order by 1 desc


-- Version 2
select food_type, rest_id, rest_name, favorites
from (
    select *, rank() over (partition by food_type order by favorites desc) as rnk
    from rest_info
) tmp
where 1=1
    and rnk = 1
order by 1 desc
