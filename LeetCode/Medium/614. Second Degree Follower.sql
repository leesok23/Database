select followee as follower, count(*) num
from follow
where followee in (select follower from follow)
group by 1
order by 1
