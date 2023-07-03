select count(distinct a.account_id) accounts_count
from subscriptions a
    join streams b on a.account_id = b.account_id
where 2021 between year(start_date) and year(end_date) and year(stream_date) != 2021
