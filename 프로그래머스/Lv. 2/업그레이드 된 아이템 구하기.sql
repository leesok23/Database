with cte as (
    select a.*, b.parent_item_id
    from item_info a 
        left join item_tree b on a.item_id = b.item_id
)

select a.item_id, a.item_name, a.rarity
from cte a
    inner join cte b on a.parent_item_id = b.item_id
where 1=1
    and b.rarity = 'RARE'
order by 1 desc
