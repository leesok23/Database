-- Version 1
select
    date_format(b.sales_date, '%Y') as year,
    date_format(b.sales_date, '%m') as month,
    count(distinct b.user_id) as PUCHASED_USERS,
    round(count(distinct b.user_id) / (select count(distinct user_id) from user_info where joined like '2021%'), 1) as PUCHASED_RATIO
from user_info a
    join online_sale b on a.user_id = b.user_id and a.joined like '2021%'
group by 1, 2
order by 1, 2

    
-- Version 2
select
    year(sales_date) as year
    , month(sales_date) as month
    , count(distinct b.user_id) as puchased_users
    , round(count(distinct b.user_id)/total_cnt,1) as puchased_ratio
from (
    select user_id, count(*) over () as total_cnt
    from user_info
    where year(joined) = 2021
) a
    left outer join online_sale b on a.user_id = b.user_id
where sales_date is not null
group by 1,2
order by 1,2
