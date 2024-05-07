select count(a.id) as fish_count
from fish_info a
    inner join fish_name_info b on a.fish_type = b.fish_type
where 1=1
    and b.fish_name in ('BASS','SNAPPER')
