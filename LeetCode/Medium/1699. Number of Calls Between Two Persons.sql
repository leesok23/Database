-- Version 1
select person1, person2, sum(call_count) call_count, sum(sum_duration) total_duration
from (
    select from_id person1, to_id as person2, count(*) call_count, sum(duration) sum_duration
    from calls
    where from_id < to_id
    group by 1, 2

    union all

    select to_id person1, from_id person2, count(*) call_count, sum(duration) sum_duration
    from calls
    where from_id > to_id
    group by 1, 2) a
group by 1, 2
order by 1, 2


-- Version 2
select
    case when from_id < to_id then from_id else to_id end person1,
    case when from_id < to_id then to_id else from_id end person2,
    count(*) call_count,
    sum(duration) total_duration
from calls
group by 1, 2
order by 1, 2
