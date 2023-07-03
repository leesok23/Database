select a.product_id, product_name
from sales a
  join product b on a.product_id = b.product_id
group by 1, 2
having sum(sale_date between '2019-01-01' and '2019-03-31') > 0 and sum(sale_date not between '2019-01-01' and '2019-03-31') = 0
