select min(america) as america, min(asia) as asia, min(europe) as europe
from (
    select
        case when continent = 'America' then name else null end as america,
        case when continent = 'Asia' then name else null end as asia,
        case when continent = 'Europe' then name else null end as europe,
        row_number() over (partition by continent order by name) as rn
    from student) a
group by rn
