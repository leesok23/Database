select country_name, case when avg(weather_state) <= 15 then 'Cold' when avg(weather_state) >= 25 then 'Hot' else 'Warm' end as weather_type
from countries a
    join weather b on a.country_id = b.country_id
where day like '2019-11%'
group by 1
