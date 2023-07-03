select a.driver_id, count(distinct b.ride_id) as cnt
from rides a
    left join rides b on a.driver_id = b.passenger_id
group by 1
