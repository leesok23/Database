select if(count(*)!=0, round(count(distinct requester_id, accepter_id) / count(distinct sender_id, send_to_id), 2), 0.00) accept_rate
from friendrequest, requestaccepted
