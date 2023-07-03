select a.sale_date, a.sold_num - b.sold_num as diff
from sales a
    join sales b on a.sale_date = b.sale_date
        and a.fruit = 'apples'
        and b.fruit = 'oranges'
