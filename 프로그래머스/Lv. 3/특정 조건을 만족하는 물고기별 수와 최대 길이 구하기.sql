-- Version 1
select
    count(distinct id) as fish_count
    , max(length) as max_length
    , fish_type
from (
    select
        fish_type
        , id
        , case when length is null then 10 else length end as length
    from fish_info
) tmp
group by fish_type
having avg(length) >= 33
order by fish_type


-- Version 2
select
    count(distinct id) as fish_count
    , max(length) as max_length
    , fish_type
from fish_info
group by fish_type
having avg(coalesce(length,10)) >= 33
order by fish_type
