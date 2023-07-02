select a.member_name, b.review_text, substring(b.review_date, 1, 10) as review_date
from member_profile a
    join (
        select
            *,
            count(*) over (partition by member_id) as num
        from rest_review) b on a.member_id = b.member_id
where b.num = (select max(num) from (select member_id, count(*) as num from rest_review group by 1) c)
order by 3, 2
