select
    a.emp_no
    , a.emp_name
    , case when b.score >= 96 then 'S'
           when b.score >= 90 then 'A'
           when b.score >= 80 then 'B'
           else 'C' end as grade
    , case when b.score >= 96 then a.sal * 0.2
           when b.score >= 90 then a.sal * 0.15
           when b.score >= 80 then a.sal * 0.1
           else 0 end as bonus
from hr_employees a
    left outer join (select emp_no, avg(score) as score from hr_grade group by 1) b on a.emp_no = b.emp_no
order by 1
