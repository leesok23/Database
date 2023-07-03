select name
from candidate a
join vote b on a.id = b.candidateId
group by 1
having count(*) = (select max(count_candidate) from (
    select candidateid, count(*) count_candidate
    from vote
    group by 1) temp )
