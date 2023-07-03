with cte as (
    select departure_airport as airport_id, flights_count
    from flights
    union all
    select arrival_airport as airport_id, flights_count
    from flights)

select airport_id 
from (
    select airport_id, rank() over (order by sum(flights_count) desc) as rk
    from cte
    group by 1) temp
where rk = 1
