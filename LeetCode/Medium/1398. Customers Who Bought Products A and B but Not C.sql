-- Version 1
select a.*
from customers a
    join orders b using (customer_id)
group by 1, 2
having sum(b.product_name='A')>0 and sum(b.product_name='B')>0 and sum(b.product_name='C')=0


-- Version 2
select *
from customers
where customer_id in (select customer_id from orders where product_name = 'A')
    and customer_id in (select customer_id from orders where product_name = 'B')
    and customer_id not in (select customer_id from orders where product_name = 'C')
