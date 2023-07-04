select
    order_date,
    round(sum(order_date = customer_pref_delivery_date) / count(*) * 100, 2) as immediate_percentage
from delivery
group by 1
order by 1 
