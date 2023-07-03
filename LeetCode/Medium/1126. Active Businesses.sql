select business_id
from events a
    left join (
        select event_type, avg(occurences) avg_occurences
        from events
        group by 1
    ) b on a.event_type = b.event_type
where occurences > avg_occurences
group by 1
having count(*) > 1
