-- Version 1
select a.product_id, first_year, quantity, price
from sales a
join (
    select product_id, min(year) first_year
    from sales
    group by 1) b on a.product_id = b.product_id and a.year = b.first_year


-- Version 2
select product_id, year first_year, quantity, price
from sales
where (product_id, year) in (select product_id, min(year) from sales group by 1)
