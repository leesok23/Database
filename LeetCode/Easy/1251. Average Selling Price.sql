select a.product_id, round(sum(price*units)/sum(units), 2) as average_price
from prices a
    join unitssold b on a.product_id = b.product_id and purchase_date between start_date and end_date
group by 1
