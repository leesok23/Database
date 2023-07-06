select book_id, author_name, left(published_date,10) as published_date
from book a
    join author b on a.author_id = b.author_id
where category = '경제'
order by 3
