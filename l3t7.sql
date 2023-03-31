select Source, avg(rub) as avrR, min(rub) as minR, max(rub) as maxR, sum(rub) as revenue
from (
select 
    l.Source as Source,
    r.Rub as rub

from 
    (
    select 
        l.DeviceID as DeviceID,
        l.Source as Source,
        r.UserID as UserID
    from installs as l
    join devices as r
        USING(DeviceID)
    ) as l

join
    (
    select 
        UserID,
        Rub
    from checks
    
    ) as r
        USING(UserID)
)
group by Source
order by Source 
