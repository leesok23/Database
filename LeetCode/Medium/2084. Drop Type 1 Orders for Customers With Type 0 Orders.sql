-- Version 1
select *
from orders
where (customer_id, order_type) in (select customer_id, min(order_type) from orders group by 1)


-- Version 2
select *
from orders
where (order_type=0 and customer_id in (select customer_id from orders group by 1 having sum(order_type=0)>0))
    or (customer_id in (select customer_id from orders group by 1 having sum(order_type=0)=0))
