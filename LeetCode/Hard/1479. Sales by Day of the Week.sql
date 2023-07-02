select
    item_category as category,
    sum(case when weekday(order_date) = 0 then quantity else 0 end) as monday,
    sum(case when weekday(order_date) = 1 then quantity else 0 end) as tuesday,
    sum(case when weekday(order_date) = 2 then quantity else 0 end) as wednesday,
    sum(case when weekday(order_date) = 3 then quantity else 0 end) as thursday,
    sum(case when weekday(order_date) = 4 then quantity else 0 end) as friday,
    sum(case when weekday(order_date) = 5 then quantity else 0 end) as saturday,
    sum(case when weekday(order_date) = 6 then quantity else 0 end) as sunday
from items a
    left join orders b on a.item_id = b.item_id
group by 1
order by 1
