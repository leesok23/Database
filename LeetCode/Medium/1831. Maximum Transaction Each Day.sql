select transaction_id
from (
    select
        transaction_id,
        date(day) as day, 
        rank() over (partition by date(day) order by amount desc) as rk
    from transactions) temp
where rk = 1
order by 1
