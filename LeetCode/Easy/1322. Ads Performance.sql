select ad_id, round(ifnull(sum(action='Clicked') / sum(action in ('Clicked','Viewed')) * 100, 0), 2) as ctr
from ads
group by 1
order by 2 desc, 1
