select seller_id
from (
    select seller_id, rank() over (order by sum(price) desc) rk
    from sales
    group by 1) temp
where rk = 1
