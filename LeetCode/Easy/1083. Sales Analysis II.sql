select buyer_id
from sales a
  left join product b using (product_id)
group by 1
having sum(product_name = 'S8') > 0 and sum(product_name = 'iPhone') = 0
