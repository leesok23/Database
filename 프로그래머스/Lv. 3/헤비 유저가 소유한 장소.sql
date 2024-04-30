-- Version 1
select *
from places
where host_id in (
    select host_id
    from places
    group by 1
    having count(*) > 1)
order by 1


-- Version 2
select id, name, host_id
from (
    select *, count(*) over (partition by host_id) as cnt
    from places
    group by 1
) tmp
where 1=1
    and cnt > 1
order by 1
