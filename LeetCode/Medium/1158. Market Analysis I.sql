select user_id as buyer_id, join_date, sum(if(year(order_date)=2019, 1, 0)) orders_in_2019
from users a
    left join orders b on a.user_id = b.buyer_id
group by 1, 2
order by 1
