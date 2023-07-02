select b.history_id, round(daily_fee * (1-ifnull(discount_rate/100,0)) * duration) as fee
from car_rental_company_car a
    join (
        select *, datediff(end_date, start_date)+1 duration
        from car_rental_company_rental_history) b on a.car_id = b.car_id
    left join car_rental_company_discount_plan c
        on a.car_type = c.car_type and
            case when b.duration >= 90 then c.duration_type like '90%'
            when b.duration >= 30 then c.duration_type like '30%'
            when b.duration >= 7 then c.duration_type like '7%' end
where a.car_type = '트럭'
order by 2 desc, 1 desc
