select member_id, member_name, gender, left(date_of_birth,10) as date_of_birth
from member_profile
where month(date_of_birth)='3' and gender='W' and tlno is not null
order by 1
