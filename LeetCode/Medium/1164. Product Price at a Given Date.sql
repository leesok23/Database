select product_id, case when change_date <= '2019-08-16' then new_price else 10 end as price
from products
where (product_id, change_date) in (select product_id, max(change_date) from products where change_date<='2019-08-16' group by 1)

union all

select product_id, 10 as price
from products
group by 1, 2
having min(change_date) > '2019-08-16'
