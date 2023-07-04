select distinct a.user_id
from users a
    join users b on a.user_id = b.user_id
        and datediff(a.created_at, b.created_at) <= 7
        and datediff(a.created_at, b.created_at) >= 0
        and (a.item != b.item or a.created_at != b.created_at or a.amount != b.amount)
