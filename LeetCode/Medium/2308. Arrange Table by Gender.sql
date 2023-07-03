select user_id, gender
from (
    select user_id, gender, row_number() over (partition by gender order by user_id) as rownumber,
    case when gender = 'female' then 1
        when gender = 'other' then 2
        else 3 end as gendernumber
    from genders) temp
order by rownumber, gendernumber
