-- Version 1
select category, price as max_price, product_name
from food_product
where (category, price) in (
    select category, max(price)
    from food_product
    where category in ('과자','국','김치','식용유')
    group by 1
)
order by 2 desc


-- Version 2
select category, price as max_price, product_name
from (
    select *, rank() over (partition by category order by price desc) as rnk
    from food_product
) temp
where 1=1
    and rnk = 1
    and category in ('과자', '국', '김치', '식용유')
order by 2 desc
