select t.team_id, t.name,
    cast(rank() over (order by t.points desc, name) as signed) - cast(rank() over (order by t.points+p.points_change desc, name) as signed) as rank_diff
from teampoints t
    join pointschange p on t.team_id = p.team_id
