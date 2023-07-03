select distinct a.session_id
from playback a
    left join ads b on a.customer_id = b.customer_id and b.timestamp between a.start_time and a.end_time
where b.ad_id is null
