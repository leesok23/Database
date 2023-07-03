select person_name
from (
    select person_name, sum(weight) over (order by turn) as cum_sum
    from queue) temp
where cum_sum <= 1000
order by cum_sum desc
limit 1
