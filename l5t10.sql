select
    UserID,
    avg(Rub),
    case
        when avg(Rub) < 5 then 'A'
        when avg(Rub) >= 5 and avg(Rub) < 10 then 'B'
        when avg(Rub) >= 10 and avg(Rub) < 20 then 'C'
        when avg(Rub) >= 20 then 'D'
        else 'foo'
    end as grade
from checks
group by UserID
order by UserID
