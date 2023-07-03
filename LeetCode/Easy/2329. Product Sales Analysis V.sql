select user_id, sum(quantity*price) as spending
from sales a
    join product b on a.product_id = b.product_id
group by 1
order by 2 desc, 1
