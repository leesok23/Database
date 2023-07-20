select dr_name, dr_id, mcdp_cd, left(hire_ymd,10) as hire_ymd
from doctor
where mcdp_cd in ('CS','GS')
order by hire_ymd desc, dr_name
