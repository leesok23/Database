select min(log_id) as start_id, max(log_id) as end_id
from (
    select log_id, row_number() over (order by log_id) rownumber
    from logs) temp
group by log_id - rownumber
order by 1
