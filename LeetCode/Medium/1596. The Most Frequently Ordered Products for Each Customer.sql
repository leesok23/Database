select a.customer_id, c.product_id, c.product_name
from customers a
    join (
        select
            customer_id, product_id,
            rank() over (partition by customer_id order by count(*) desc) rk
        from orders
        group by 1, 2) b on a.customer_id = b.customer_id
    join products c on b.product_id = c.product_id
where rk = 1
