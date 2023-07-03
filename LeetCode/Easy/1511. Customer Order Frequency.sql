select b.customer_id, b.name
from orders a
    join customers b using (customer_id)
    join product c using (product_id)
group by 1, 2
having sum(if(left(order_date,7)='2020-06', price*quantity, 0)) >= 100
    and sum(if(left(order_date,7)='2020-07', price*quantity, 0)) >= 100
