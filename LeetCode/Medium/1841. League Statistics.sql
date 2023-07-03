select
    b.team_name,
    count(a.team_id) matches_played,
    sum(case when a.team_goals > a.against_goals then 3
        when a.team_goals = a.against_goals then 1
        else 0 end) points,
    sum(a.team_goals) goal_for,
    sum(a.against_goals) goal_against,
    sum(a.team_goals) - sum(a.against_goals) goal_diff
from (
    select
        home_team_id as team_id,
        home_team_goals as team_goals,
        away_team_goals as against_goals
    from matches

    union all

    select
        away_team_id as team_id,
        away_team_goals as team_goals,
        home_team_goals as against_goals
    from matches
    ) a
    left join teams b on a.team_id = b.team_id
group by 1
order by 3 desc, 6 desc, 1
