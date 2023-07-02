select max(num) as num
from (
    select num, count(*) as count_num
    from mynumbers
    group by 1
) a
where count_num = 1
