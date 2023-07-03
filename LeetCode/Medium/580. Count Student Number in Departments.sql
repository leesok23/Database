select dept_name, count(b.dept_id) as student_number
from department a
    left join student b on a.dept_id = b.dept_id
group by 1
order by 2 desc, 1
