select a.author_id, a.author_name, b.category, sum(ifnull(b.price*c.sales,0)) as total_sales
from author a
    left join book b on a.author_id = b.author_id
    left join book_sales c on b.book_id = c.book_id and c.sales_date like '2022-01%'
group by 1, 2, 3
order by 1, 3 desc
