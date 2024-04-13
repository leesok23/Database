select
    id
    , case when rnk <= (total/4) then 'CRITICAL'
           when rnk <= (total/2) then 'HIGH'
           when rnk <= (total*3/4) then 'MEDIUM'
           else 'LOW' end as colony_name
    -- , case when pct <= 0.25 then 'CRITICAL'
    --        when pct <= 0.5 then 'HIGH'
    --        when pct <= 0.75 then 'MEDIUM'
    --        else 'LOW' end as colony_name
    -- , case when qrt = 1 then 'CRITICAL'
    --        when qrt = 2 then 'HIGH'
    --        when qrt = 3 then 'MEDIUM'
    --        else 'LOW' end as colony_name
from (
    select
        id
        , rank() over (order by size_of_colony desc) as rnk, count(id) over () as total
        -- , percent_rank() over (order by size_of_colony desc) as pct
        -- , ntile(4) over (order by size_of_colony desc) as qrt
    from ecoli_data
) tmp
order by 1
