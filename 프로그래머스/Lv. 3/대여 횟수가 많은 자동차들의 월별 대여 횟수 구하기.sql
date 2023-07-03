select month(start_date) as month, car_id, count(*) as records
from car_rental_company_rental_history
where left(start_date,7) between '2022-08' and '2022-10'
    and car_id in (
        select car_id
        from car_rental_company_rental_history
        group by 1
        having sum(left(start_date,7) between '2022-08' and '2022-10') >= 5)
group by 1, 2
order by 1, 2 desc
