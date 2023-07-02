select date_format(a.sales_date, '%Y') as year, date_format(a.sales_date, '%m') as month, b.gender, count(distinct a.user_id) as users
from online_sale a
    join user_info b on a.user_id = b.user_id
where b.gender is not null
group by 1, 2, 3
order by 1, 2, 3
