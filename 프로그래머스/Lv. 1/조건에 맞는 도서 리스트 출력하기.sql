select book_id, left(published_date,10) as published_date
from book
where category = '인문' and year(published_date) = 2021
order by 2
