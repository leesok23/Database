select round(sum(tiv_2016), 2) as tiv_2016
from insurance a
where tiv_2015 in (select tiv_2015 from insurance where a.pid != pid)
    and (lat,lon) not in (select lat, lon from insurance where a.pid != pid)
