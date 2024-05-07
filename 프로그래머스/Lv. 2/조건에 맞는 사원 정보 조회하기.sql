select sum(b.score) as score, a.emp_no, a.emp_name, a.position, a.email
from hr_employees a
    inner join hr_grade b on a.emp_no = b.emp_no
group by 2
order by 1 desc
limit 1
