-- Version 1
select player_id, event_date,
    sum(games_played) over (partition by player_id order by event_date) games_played_so_far
from activity


-- Version 2
select a.player_id, a.event_date, sum(b.games_played) games_played_so_far
from activity a
    left join activity b on a.player_id = b.player_id and a.event_date >= b.event_date
group by 1, 2
