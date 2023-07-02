select product_id, sum(quantity) total_quantity
from sales
group by 1
