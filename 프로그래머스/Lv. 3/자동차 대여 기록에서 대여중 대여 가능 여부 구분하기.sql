-- Version 1
select car_id, case when sum(start_date <= '2022-10-16' and end_date >= '2022-10-16') > 0 then '대여중' else '대여 가능' end as availability
from car_rental_company_rental_history
group by 1
order by 1 desc


-- Version 2
select
    car_id
    , case when availability = 0 then '대여 가능' else '대여중' end as availability
from (
    select
        car_id
        , sum(case when date('2022-10-16') between date(start_date) and date(end_date) then 1 else 0 end) as availability
    from car_rental_company_rental_history
    group by 1
) tmp
order by 1 desc
