select year(ym) as year, round(avg(pm_val1),2) as pm10, round(avg(pm_val2),2) as 'pm2.5'
from air_pollution
where 1=1
    and location2 = '수원'
group by 1
order by 1
