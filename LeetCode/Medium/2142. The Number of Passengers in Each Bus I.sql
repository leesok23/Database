select bus_id, total_passengers - lag(total_passengers, 1, 0) over (order by arrival_time) as passengers_cnt
from (
    select a.bus_id, a.arrival_time, count(passenger_id) as total_passengers
    from buses a
        left join passengers b on a.arrival_time >= b.arrival_time
    group by 1, 2) temp
order by 1
