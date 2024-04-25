-- Version 1
select a.member_name, b.review_text, substring(b.review_date, 1, 10) as review_date
from member_profile a
    join (
        select
            *,
            count(*) over (partition by member_id) as num
        from rest_review) b on a.member_id = b.member_id
where b.num = (select max(num) from (select member_id, count(*) as num from rest_review group by 1) c)
order by 3, 2


-- Version 2
select
    a.member_name
    , b.review_text
    , date_format(b.review_date,'%Y-%m-%d') as review_date
from member_profile a
    inner join (
        select *, count(*) over (partition by member_id) as cnt
        from rest_review
    ) b on a.member_id = b.member_id
where 1=1
    and b.cnt = (select max(cnt) from (select member_id, count(*) as cnt from rest_review group by 1) tmp)
order by 3, 2
