select distinct a.user_id
from purchases a
    join purchases b on a.user_id = b.user_id
        and datediff(a.purchase_date, b.purchase_date) between 0 and 7
        and a.purchase_id != b.purchase_id
order by 1
