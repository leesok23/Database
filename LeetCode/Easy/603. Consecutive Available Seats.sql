select distinct a.seat_id
from cinema a, cinema b
where a.free = 1 and b.free = 1
    and ((a.seat_id + 1 = b.seat_id) or (a.seat_id - 1 = b.seat_id))
order by 1
