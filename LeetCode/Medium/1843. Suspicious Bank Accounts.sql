with cte as (
    select a.account_id, a.max_income, date_format(t.day, '%Y%m') as date, sum(t.amount) as total_amount
    from accounts a
        join transactions t on a.account_id = t.account_id and t.type = 'Creditor'
    group by 1, 2, 3
    having sum(t.amount) > a.max_income)

select distinct c2.account_id
from cte c1
    join cte c2 on c1.account_id = c2.account_id and c1.date - c2.date = 1
