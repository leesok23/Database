select a.symbol as metal, b.symbol as nonmetal
from elements a
    join elements b on a.type = 'Metal' and b.type = 'Nonmetal'
