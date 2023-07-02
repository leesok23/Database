with recursive cte as (
    select 0 as hour, 0 as count
    
    union all
    
    select hour+1 as hour, 0 as count
    from cte
    where hour < 23
)

select a.hour, count(b.animal_id) as count
from cte a
    left join animal_outs b on a.hour = hour(b.datetime)
group by 1
order by 1
