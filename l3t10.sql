select Platform, count(distinct DeviceID)
from (
select 
    l.DeviceID as DeviceID,
    l.Platform as Platform,
    r.events as events
from installs as l
left semi join
    (
    select events,DeviceID
    from events
    ) as r
        using(DeviceID)
 where events >= 0   
)
group by Platform
