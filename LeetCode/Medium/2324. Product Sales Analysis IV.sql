select user_id, product_id
from (
    select user_id, a.product_id, sum(quantity * price) total_spent,
        rank() over (partition by user_id order by sum(quantity * price) desc) as rk
    from sales a
        join product b on a.product_id = b.product_id
    group by 1, 2) temp
where rk = 1
