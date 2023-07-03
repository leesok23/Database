select
    date_format(trans_date, '%Y-%m') as month,
    country,
    sum(state='approved') as approved_count,
    sum(case when state='approved' then amount else 0 end) as approved_amount,
    sum(state='chargebacks') as chargeback_count,
    sum(case when state='chargebacks' then amount else 0 end) as chargeback_amount
from (
    select * from transactions
    where state='approved'
    
    union all
    
    select trans_id as id, country, 'chargebacks' as state, amount, a.trans_date
    from chargebacks a
        join transactions b on a.trans_id = b.id) temp
group by 1, 2
