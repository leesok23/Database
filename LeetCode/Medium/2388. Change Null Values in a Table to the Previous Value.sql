with recursive cte as (
    select id, drink, rn
    from (
        select id, drink, row_number() over () as rn
        from coffeeshop) temp
    where rn = 1
    
    union all
    
    select cte2.id, coalesce(cte2.drink, cte.drink) as drink, cte2.rn
    from cte
        join (select *, row_number() over () as rn from coffeeshop) cte2 on cte.rn = cte2.rn - 1)

select id, drink from cte
