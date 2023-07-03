select a.book_id, name
from books a
    left join orders b on a.book_id = b.book_id
where datediff('2019-06-23', available_from) > 30
group by 1, 2
having sum(case when quantity is null or datediff('2019-06-23',dispatch_date) > 365 then 0 else quantity end) < 10
