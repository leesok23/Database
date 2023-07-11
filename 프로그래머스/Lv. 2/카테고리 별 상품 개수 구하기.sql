select left(product_code,2) as category, count(product_code) as products
from product
group by 1
order by 1
