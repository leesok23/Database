-- Version 1
select school_id, case when score is null then -1 else min(score) end as score
from schools a
    left join exam b on a.capacity >= b.student_count
group by 1


-- Version 2
select school_id, case when score is null then -1 else score end as score
from (
    select a.school_id, b.score,
        rank() over (partition by school_id order by score) as rk
    from schools a
        left join exam b on a.capacity >= b.student_count) temp
where rk = 1
