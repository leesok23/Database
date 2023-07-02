select user_id, nickname, sum(price) as total_sales
from used_goods_board a
    join used_goods_user b on a.writer_id = b.user_id
where status = 'DONE'
group by 1
having sum(price) >= 700000
order by 3
