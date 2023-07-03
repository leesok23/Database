select a.sub_id as post_id, count(distinct b.sub_id) as number_of_comments
from submissions a
    left join submissions b on a.sub_id = b.parent_id
where a.parent_id is null
group by 1
order by 1
