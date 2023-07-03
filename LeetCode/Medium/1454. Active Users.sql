select distinct accounts.id, name
from accounts 
    join (
        select a.id, a.login_date, b.login_date login_date_b
        from logins a
            join logins b on datediff(a.login_date,b.login_date) between 1 and 4 and a.id = b.id
    ) temp on accounts.id = temp.id
group by 1, login_date
having count(distinct temp.login_date_b) = 4
