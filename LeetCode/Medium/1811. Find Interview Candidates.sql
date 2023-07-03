-- Version 1
select name, mail
from (
    select
        *,
        lag(contest_id, 1) over (partition by user_id order by contest_id) as lag_1,
        lag(contest_id, 2) over (partition by user_id order by contest_id) as lag_2
    from contests c
        join users u on c.gold_medal = u.user_id or c.silver_medal = u.user_id or c.bronze_medal = u.user_id) temp
group by 1, 2
having sum(user_id = gold_medal) >= 3
    or sum(contest_id - lag_1 = 1 and contest_id - lag_2 = 2) >= 1


-- Version 2
select distinct name, mail
from (
    select
        b.name, b.mail, a.contest_id,
        row_number() over (partition by b.name, b.mail order by a.contest_id) as rn
    from contests a
        join users b
            on b.user_id = a.gold_medal or b.user_id = a.silver_medal or b.user_id = a.bronze_medal) temp
group by 1, 2, contest_id - rn
having count(*) >= 3

union

select d.name, d.mail
from contests c
    join users d on d.user_id = c.gold_medal
group by 1, 2
having count(*) >= 3
