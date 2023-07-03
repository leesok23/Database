select first_col, second_col
from (
    select *
    from (
        select first_col, row_number() over (order by first_col) as row1
        from data) a
        join (
            select second_col, row_number() over (order by second_col desc) as row2
            from data) b on row1 = row2) temp
order by row1
