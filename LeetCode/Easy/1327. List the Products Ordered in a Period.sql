select product_name, sum(unit) as unit
from products a
    join orders b on a.product_id = b.product_id
where order_date < '2020-03-01' and order_date >= '2020-02-01'
group by 1
having sum(unit) >= 100
