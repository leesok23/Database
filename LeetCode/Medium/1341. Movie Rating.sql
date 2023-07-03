(select name as results
from movierating
    join users using (user_id)
group by 1
order by count(distinct movie_id) desc, name
limit 1)

union all

(select title as results
from movierating
    join movies using(movie_id)
where created_at >= '2020-02-01' and created_at < '2020-03-01'
group by 1
order by avg(rating) desc, title
limit 1)
