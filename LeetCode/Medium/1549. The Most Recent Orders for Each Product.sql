-- Version 1
select product_name, product_id, order_id, order_date
from (
    select
        product_name, a.product_id, order_id, order_date,
        rank() over (partition by product_id order by order_date desc) as rk
    from orders a
        join products b on a.product_id = b.product_id) temp
where rk = 1
order by 1, 2, 3


-- Version 2
select product_name, a.product_id, order_id, order_date
from orders a
    join (select product_id, max(order_date) recent_date from orders group by 1) b
        on a.product_id = b.product_id and a.order_date = b.recent_date
    join products c on a.product_id = c.product_id
order by 1, 2, 3
