select a.id, a.genotype, b.genotype as parent_genotype
from ecoli_data a
    left join ecoli_data b on a.parent_id = b.id
where 1=1
    and b.id is not null
    and (a.genotype & b.genotype) = b.genotype
order by 1
