-- Version 1
select
    user_id,
    user_name,
    credit + sum(case when user_id=paid_by then -1 * amount when user_id=paid_to then amount else 0 end) as credit,
    case when credit + sum(case when user_id=paid_by then -1 * amount when user_id=paid_to then amount else 0 end) < 0 then 'Yes'
        else 'No' end as credit_limit_breached
from users a 
    left join transactions b on a.user_id=paid_by or user_id=paid_to
group by 1, 2


-- Version 2
select
    user_id,
    user_name,
    sum(credit)/count(*) + sum(case when user_id=paid_by then -1 * amount when user_id=paid_to then amount else 0 end) as credit,
    case when sum(credit)/count(*) + sum(case when user_id=paid_by then -1 * amount
        when user_id=paid_to then amount else 0 end) < 0 then 'Yes'
        else 'No' end as credit_limit_breached
from users a 
    left join transactions b on a.user_id=paid_by or user_id=paid_to
group by 1, 2
