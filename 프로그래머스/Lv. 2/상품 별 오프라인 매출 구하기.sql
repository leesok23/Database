select product_code, sum(price*sales_amount) as sales
from product a
    join offline_sale b on a.product_id = b.product_id
group by 1
order by 2 desc, 1
