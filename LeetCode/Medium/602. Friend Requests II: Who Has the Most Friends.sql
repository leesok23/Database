select id, count(*) as num
from (
    select requester_id as id
    from requestaccepted

    union all

    select accepter_id as id
    from requestaccepted) temp
group by 1
order by 2 desc
limit 1
