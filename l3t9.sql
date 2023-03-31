select Source, AppPlatform, avg(avg_views) as avg_views
from (
select 
    l.Source as Source,
    r.AppPlatform as AppPlatform,
    r.events as avg_views

from installs as l
join 
    (
    select
        DeviceID,
        AppPlatform,
        events
    from events
    ) as r 
        USING(DeviceID)
--order by avg_views desc
)
group by Source,AppPlatform

order by avg_views desc

