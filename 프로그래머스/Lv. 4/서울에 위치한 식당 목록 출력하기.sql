select a.rest_id, a.rest_name, a.food_type, a.favorites, a.address,
    round(avg(review_score), 2) as score
    -- round(sum(ifnull(review_score,0)) / count(review_score), 2) as score
from rest_info a
    join rest_review b on a.rest_id = b.rest_id
where a.address like '서울%'
group by 1
order by 6 desc, 4 desc
