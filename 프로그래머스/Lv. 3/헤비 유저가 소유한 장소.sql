select *
from places
where host_id in (
    select host_id
    from places
    group by 1
    having count(*) > 1)
order by 1
