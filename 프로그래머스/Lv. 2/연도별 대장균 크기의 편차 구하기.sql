select
    year(a.differentiation_date) as year
    , b.max_size - size_of_colony as year_dev
    , a.id
from ecoli_data a
    inner join (
        select year(differentiation_date) as year, max(size_of_colony) as max_size
        from ecoli_data
        group by 1
    ) b on year(a.differentiation_date) = b.year
order by 1,2
