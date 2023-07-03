-- Version 1
select a.student_id, min(a.course_id) as course_id, grade
from enrollments a
    join (
        select student_id, max(grade) max_grade
        from enrollments
        group by 1) b on a.student_id = b.student_id and a.grade = b.max_grade
group by 1, 3
order by 1


-- Version 2
select student_id, min(course_id) as course_id, grade
from enrollments
where (student_id, grade) in (
    select student_id, max(grade)
    from enrollments
    group by 1)
group by 1, 3
order by 1
