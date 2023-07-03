select a.category, sum(b.sales) as total_sales
from book a
    join book_sales b on a.book_id = b.book_id
where left(b.sales_date,7) = '2022-01'
group by 1
order by 1
