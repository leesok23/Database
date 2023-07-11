-- Version 1
select
    price-(price%10000) as price_group,
    count(product_code) as products
from product
group by 1
order by 1


-- Version 2
select
    floor(price/10000)*10000 as price_group,
    count(product_code) as products
from product
group by 1
order by 1
