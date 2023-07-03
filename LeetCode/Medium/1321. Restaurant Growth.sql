select a.visited_on, sum(b.amount) amount, round(sum(b.amount)/7,2) average_amount
from (select visited_on, sum(amount) amount from customer group by 1) a
    join customer b on datediff(a.visited_on,b.visited_on) between 0 and 6
group by 1
having count(distinct b.visited_on) = 7
