select a.product_id, b.product_name, sum(a.amount * b.price) as total_sales
from food_order a
    join food_product b on a.product_id = b.product_id
where a.produce_date like '2022-05%'
group by 1, 2
order by 3 desc, 1
