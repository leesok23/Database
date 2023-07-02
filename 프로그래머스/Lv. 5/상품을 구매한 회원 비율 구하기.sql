select
    date_format(b.sales_date, '%Y') as year,
    date_format(b.sales_date, '%m') as month,
    count(distinct b.user_id) as PUCHASED_USERS,
    round(count(distinct b.user_id) / (select count(distinct user_id) from user_info where joined like '2021%'), 1) as PUCHASED_RATIO
from user_info a
    join online_sale b on a.user_id = b.user_id and a.joined like '2021%'
group by 1, 2
order by 1, 2
