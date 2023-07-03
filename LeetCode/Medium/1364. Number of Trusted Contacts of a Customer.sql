select invoice_id, b.customer_name, price, count(c.contact_name) as contacts_cnt, count(d.email) as trusted_contacts_cnt
from invoices a
    join customers b on a.user_id = b.customer_id
    left join contacts c on b.customer_id = c.user_id
    left join customers d on c.contact_email = d.email
group by 1, 2, 3
order by 1
