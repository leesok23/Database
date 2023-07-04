select a.employee_id
from employees a
    left join (
        select employee_id, sum(ceiling(timestampdiff(second, in_time, out_time)/60))/60 as worked_hours
        from logs
        group by 1) b on a.employee_id = b.employee_id
where a.needed_hours > b.worked_hours or b.worked_hours is null
