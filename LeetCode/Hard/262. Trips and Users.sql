select
    request_at day,
    round(sum(case when status like '%cancelled%' then 1 else 0 end)/sum(1), 2) 'cancellation rate'
from trips
where
    request_at >= '2013-10-01' and request_at <= '2013-10-03'
    and client_id in (select users_id from users where banned = 'No')
    and driver_id in (select users_id from users where banned = 'No')
group by 1
order by 1
