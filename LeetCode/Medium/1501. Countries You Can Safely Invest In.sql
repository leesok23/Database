select c.name country
from (
    select caller_id id, duration from calls

    union all

    select callee_id id, duration from calls
    ) a
    left join (select *, substring(phone_number,1,3) country_code from person
    ) b on a.id = b.id
    left join country c on b.country_code = c.country_code
group by 1
having sum(duration)/count(*) > (select sum(duration)/count(*) from calls)
