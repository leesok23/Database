select distinct a.car_id
from car_rental_company_rental_history a
    join car_rental_company_car b on a.car_id = b.car_id
where b.car_type = '세단' and a.start_date like '2022-10%'
order by 1 desc
