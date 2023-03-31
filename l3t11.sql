select count(distinct eDevID)/count(distinct iDevID) as xui
from (
select 
    l.DeviceID as iDevID,
    r.DeviceID as eDevID
from installs as l
left join events as r
    using(DeviceID)
)
