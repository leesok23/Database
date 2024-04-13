select
    a.dept_id
    , a.dept_name_en
    , round(avg(b.sal)) as avg_sal
from hr_department a
    inner join hr_employees b on a.dept_id = b.dept_id
group by 1,2
order by 3 desc
