select order_id
from ordersdetails
group by 1
having max(quantity) > (
    select max(avg_quantity)
    from (
        select order_id, sum(quantity)/count(*) avg_quantity
        from ordersdetails
        group by 1) temp)
