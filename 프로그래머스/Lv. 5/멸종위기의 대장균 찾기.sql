with recursive cte as (
    select id, 1 as gr
    from ecoli_data
    where parent_id is null
    union all
    select b.id, gr+1 as gr
    from cte a
        inner join ecoli_data b on a.id = b.parent_id
)

select count(distinct id) as count, gr as generation
from cte
where id not in (select parent_id from ecoli_data where parent_id is not null)
group by 2
order by 2
