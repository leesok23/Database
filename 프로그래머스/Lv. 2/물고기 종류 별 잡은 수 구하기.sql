select count(a.id) as fish_count, b.fish_name
from fish_info a
    inner join fish_name_info b on a.fish_type = b.fish_type
group by 2
order by 1 desc
