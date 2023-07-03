select distinct a.user_id
from confirmations a
    join confirmations b on a.user_id = b.user_id
        and timestampdiff(second, a.time_stamp, b.time_stamp) between 1 and 24*60*60
order by 1
