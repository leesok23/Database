select a.member_id, a.name,
    case when 100 * count(c.visit_id) / count(b.visit_id) >= 80 then 'Diamond'
        when 100 * count(c.visit_id) / count(b.visit_id) between 50 and 80 then 'Gold'
        when 100 * count(c.visit_id) / count(b.visit_id) < 50 then 'Silver'
        else 'Bronze' end as category
from members a
    left join visits b on a.member_id = b.member_id
    left join purchases c on b.visit_id = c.visit_id
group by 1, 2
