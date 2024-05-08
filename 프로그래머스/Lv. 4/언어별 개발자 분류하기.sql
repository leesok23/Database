select
    min(grade) as grade, id, email
from (
    select
        case when b.name = 'Python' and c.category = 'Front End' then 'A'
             when b.name = 'C#' then 'B'
             when c.category = 'Front End' then 'C'
             end as grade
        , a.id
        , a.email
    from developers a
        inner join skillcodes b on (a.skill_code & b.code) = b.code
        inner join skillcodes c on (a.skill_code & c.code) = c.code
) tmp
where 1=1
    and grade is not null
group by 2,3
order by 1,2
