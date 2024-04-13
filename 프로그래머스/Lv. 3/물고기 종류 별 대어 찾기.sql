-- Version 1
select
    a.id
    , b.fish_name
    , a.length
from fish_info a
    inner join fish_name_info b on a.fish_type = b.fish_type
    inner join (select fish_type, max(coalesce(length,10)) as length from fish_info group by 1) c on a.fish_type = c.fish_type and coalesce(a.length,10) = c.length
order by 1


-- Version 2
select
    a.id
    , b.fish_name
    , a.length
from fish_info a
    inner join fish_name_info b on a.fish_type = b.fish_type
where 1=1
    and (a.fish_type, a.length) in (select fish_type, max(coalesce(length,10)) from fish_info group by 1)
order by 1
