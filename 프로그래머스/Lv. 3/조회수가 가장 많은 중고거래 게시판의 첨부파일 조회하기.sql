-- Version 1
select concat('/home/grep/src/',a.board_id,'/',b.file_id,b.file_name,b.file_ext) as file_path
from used_goods_board a
    join used_goods_file b on a.board_id = b.board_id
where views = (select max(views) from used_goods_board)
order by file_id desc


-- Version 2
select concat('/home/grep/src/',b.board_id,'/',b.file_id,b.file_name,b.file_ext) as file_path
from (
    select *, rank() over (order by views desc) as rnk
    from used_goods_board
) a
    inner join used_goods_file b on a.board_id = b.board_id
where 1=1
    and a.rnk = 1
order by 1 desc
