select b.name, sum(ifnull(a.rest,0)) as rest, sum(ifnull(a.paid,0)) as paid, sum(ifnull(a.canceled,0)) as canceled, sum(ifnull(a.refunded,0)) as refunded
from invoice a
    right join product b on a.product_id = b.product_id
group by 1
order by 1
