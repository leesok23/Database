select question_id as survey_log
from surveylog
group by 1
order by sum(action='answer') / sum(action='show') desc, 1
limit 1
