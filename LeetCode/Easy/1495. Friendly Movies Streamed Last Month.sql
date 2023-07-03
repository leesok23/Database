select distinct a.title
from content a
    join tvprogram b on a.content_id = b.content_id
where date_format(b.program_date, '%Y-%m') = '2020-06' and a.content_type = 'Movies' and a.kids_content = 'Y'
