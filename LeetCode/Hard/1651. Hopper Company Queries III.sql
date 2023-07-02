with recursive cte1 as (
    select 1 as month
    union
    select month+1 from cte1 where month<12),

cte2 as (
    select
        month(b.requested_at) as month,
        sum(a.ride_distance) sum_ride_distance,
        sum(a.ride_duration) sum_ride_duration
    from acceptedrides a
        join rides b on a.ride_id = b.ride_id
    where year(b.requested_at) = 2020
    group by 1),

cte3 as (
    select
        a.month,
        ifnull(sum_ride_distance, 0) as ride_distance,
        ifnull(sum_ride_duration, 0) as ride_duration
    from cte1 a
        left join cte2 b on a.month = b.month)

select
    a.month,
    round(sum(b.ride_distance)/3,2) as average_ride_distance,
    round(sum(b.ride_duration)/3,2) as average_ride_duration
from cte3 a
    join cte3 b on a.month = b.month-1 or a.month = b.month-2 or a.month=b.month
where a.month <= 10
group by 1
order by 1
