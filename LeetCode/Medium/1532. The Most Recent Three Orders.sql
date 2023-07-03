select customer_name, customer_id, order_id, order_date
from (
    select
        name as customer_name, a.customer_id, order_id, order_date,
        rank() over (partition by customer_id order by order_date desc) as rk
    from orders a
        join customers b on a.customer_id = b.customer_id) temp
where rk <= 3
order by 1, 2, 4 desc
