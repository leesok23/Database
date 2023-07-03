-- Version 1
select a.account_id, a.day, sum(case when b.type='Deposit' then b.amount else b.amount*(-1) end) as balance
from transactions a
    join transactions b on a.account_id = b.account_id and a.day >= b.day
group by 1, 2
order by 1, 2


-- Version 2
select account_id, day,
    sum(case when type = 'Deposit' then amount else amount*(-1) end) over (partition by account_id order by day) as balance
from transactions
