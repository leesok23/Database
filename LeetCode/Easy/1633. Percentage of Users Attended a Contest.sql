select contest_id, round(100*count(b.user_id)/(select count(*) from users), 2) as percentage
from users a
    join register b on a.user_id = b.user_id
group by 1
order by 2 desc, 1
