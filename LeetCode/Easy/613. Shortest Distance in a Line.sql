select min(abs(x-lag_x)) as shortest
from (
    select x, lag(x,1) over (order by x) lag_x
    from point) temp
