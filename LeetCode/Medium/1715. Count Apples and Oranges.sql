-- Version 1
select
    sum(coalesce(a.apple_count,0)) + sum(coalesce(b.apple_count,0)) apple_count,
    sum(coalesce(a.orange_count,0)) + sum(coalesce(b.orange_count,0)) orange_count
from boxes a
    left join chests b
on a.chest_id = b.chest_id


-- Version 2
select
    sum(case when a.chest_id is null then a.apple_count
        else a.apple_count+b.apple_count end) as apple_count,
    sum(case when a.chest_id is null then a.orange_count
        else a.orange_count+b.orange_count end) as orange_count
from boxes a
    left join chests b on a.chest_id = b.chest_id
