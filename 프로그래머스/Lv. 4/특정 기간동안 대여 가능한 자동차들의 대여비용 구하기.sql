select a.car_id, a.car_type, floor(a.daily_fee * (1-c.discount_rate/100) * 30) as fee
from car_rental_company_car a
    join car_rental_company_discount_plan c on a.car_type = c.car_type
where a.car_type in ('세단','SUV')
    and c.duration_type like '%30%'
    and a.daily_fee * (1-c.discount_rate/100) * 30 >= 500000 and a.daily_fee * (1-c.discount_rate/100) * 30 < 2000000
    and a.car_id not in (
        select distinct car_id
        from car_rental_company_rental_history
        where start_date <= '2022-11-30' and end_date >= '2022-11-01')
order by 3 desc, 2, 1 desc
