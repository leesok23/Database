select name, sum(ifnull(distance,0)) travelled_distance
from users
    left join rides on users.id = rides.user_id
group by users.id
order by 2 desc, 1
