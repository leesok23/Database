with cte as (
    select product_id, year(purchase_date) as year, count(*) as order_count
    from orders
    group by 1, 2
    having count(*) >= 3)

select distinct a.product_id
from cte a
    join cte b on (a.year+1=b.year or a.year-1=b.year) and a.product_id=b.product_id
