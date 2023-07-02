select
    user_id,
    nickname,
    concat(city, ' ', street_address1, ' ', street_address2) as 전체주소,
    concat(substring(tlno, 1, 3), '-', substring(tlno, 4, 4), '-', substring(tlno, 8, 4)) as 전화번호
from used_goods_board a
    join used_goods_user b on a.writer_id = b.user_id
group by 1
having count(*) >= 3
order by 1 desc
