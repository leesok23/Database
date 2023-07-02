with cte as (
    select
        a.student_id,
        a.student_name,
        rank() over (partition by exam_id order by score) as rk1,
        rank() over (partition by exam_id order by score desc) as rk2
    from student a
        join exam b on a.student_id = b.student_id)

select student_id, student_name
from cte
group by 1, 2
having min(rk1) != 1 and min(rk2) != 1
order by 1
