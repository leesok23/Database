select a.apnt_no, b.pt_name, b.pt_no, c.mcdp_cd, c.dr_name, a.apnt_ymd
from appointment a
    join patient b on a.pt_no = b.pt_no
    join doctor c on a.mddr_id = c.dr_id
where c.mcdp_cd = 'CS' and a.apnt_cncl_yn = 'N' and a.apnt_ymd like '2022-04-13%'
order by 6
