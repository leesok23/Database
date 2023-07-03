select team_id, team_name,
    sum(
        case when team_id = host_team and host_goals > guest_goals then 3
        when team_id = host_team and host_goals = guest_goals then 1
        when team_id = guest_team and guest_goals > host_goals then 3
        when team_id = guest_team and guest_goals = host_goals then 1
        else 0 end) as num_points
from teams a
    left join matches b on a.team_id = b.host_team or a.team_id = b.guest_team
group by 1, 2
order by 3 desc, 1
