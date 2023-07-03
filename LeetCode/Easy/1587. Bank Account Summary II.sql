select name, sum(amount) as balance
from transactions a
    join users b on a.account = b.account
group by 1
having sum(amount) > 10000
