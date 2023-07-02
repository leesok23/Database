with cte as (
    select
        invoice_id,
        rank() over (order by sum(quantity*price) desc, invoice_id) as rk
    from purchases a
        join products b on a.product_id = b.product_id
    group by 1)

select
    a.product_id,
    quantity,
    price * quantity as price
from purchases a
    join products b on a.product_id = b.product_id
    join cte c on a.invoice_id = c.invoice_id
where rk = 1
