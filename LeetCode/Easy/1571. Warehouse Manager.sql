select name as warehouse_name, sum(volume * units) as volume
from warehouse a
join (
    select product_id, width*length*height as volume
    from products
    group by 1) b on a.product_id = b.product_id
group by 1
