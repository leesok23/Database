-- Version 1
select a.item_id, a.item_name, a.rarity
from item_info a
    left outer join item_tree b on a.item_id = b.parent_item_id
where 1=1
    and b.item_id is null
order by 1 desc


-- Version 2
select item_id, item_name, rarity
from item_info
where 1=1
    and item_id not in (select parent_item_id from item_tree where parent_item_id is not null)
order by 1 desc
