select candidate_id
from candidates a
    join rounds b on a.interview_id = b.interview_id and a.years_of_exp >= 2
group by 1
having sum(score) > 15
