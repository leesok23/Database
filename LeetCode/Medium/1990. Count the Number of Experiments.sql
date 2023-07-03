with cte as (
    select platform, experiment_name
    from (
        select 'Android' as platform
        union
        select 'IOS' as platform
        union
        select 'Web' as platform
    ) a
        join (
            select 'Reading' as experiment_name
            union 
            select 'Sports' as experiment_name
            union
            select 'Programming' as experiment_name) b)
    
select a.platform, a.experiment_name, count(b.experiment_id) as num_experiments
from cte a
    left join experiments b on a.platform = b.platform and a.experiment_name = b.experiment_name
group by 1, 2
