with recursive cte as (
    select product_id, period_start, period_end
    from sales

    union all

    select product_id, date_add(period_start, interval 1 day) as period_start, period_end
    from cte
    where period_start < period_end
)

select a.product_id, a.product_name, left(c.period_start,4) as report_year, sum(b.average_daily_sales) as total_amount
from product a
    join sales b on a.product_id = b.product_id
    join cte c on a.product_id = c.product_id
group by 1, 2, 3
order by 1, 3
