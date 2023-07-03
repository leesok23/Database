select round(min(sqrt(power(a.x-b.x, 2) + power(a.y-b.y, 2))),2) as shortest
from point2d a
    join point2d b on a.x != b.x or a.y != b.y
