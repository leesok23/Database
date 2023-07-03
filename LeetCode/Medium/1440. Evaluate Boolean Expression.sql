select
    a.*,
    case when operator = '>' and b.value > c.value then 'true'
        when operator = '<' and b.value < c.value then 'true'
        when operator = '=' and b.value = c.value then 'true'
        else 'false' end as value
from expressions a
    join variables b on a.left_operand = b.name
    join variables c on a.right_operand = c.name
