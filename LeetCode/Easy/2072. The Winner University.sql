select
    case when ny > cal then 'New York University'
        when ny < cal then 'California University'
        else 'No Winner' end as winner
from (select count(*) as ny from newyork where score>=90) a
    join (select count(*) as cal from california where score>=90) b
