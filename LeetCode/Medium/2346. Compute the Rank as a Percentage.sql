select student_id, department_id, ifnull(round((rk-1)*100 / (num_student-1), 2),0) as percentage
from (
    select a.student_id, a.department_id, num_student, rank() over (partition by department_id order by mark desc) as rk
    from students a
        join (select department_id, count(*) num_student from students group by 1) b on a.department_id = b.department_id) temp
