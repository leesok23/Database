# Write your MySQL query statement below
select employee_id, team_size
from employee a
    left join (
        select team_id, count(*) as team_size
        from employee
        group by 1) b on a.team_id = b.team_id
