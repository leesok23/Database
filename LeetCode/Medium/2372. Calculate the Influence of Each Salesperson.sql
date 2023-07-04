select a.salesperson_id, a.name, sum(case when price is null then 0 else price end) as total
from salesperson a
    left join customer b on a.salesperson_id = b.salesperson_id
    left join sales c on b.customer_id = c.customer_id
group by 1, 2
