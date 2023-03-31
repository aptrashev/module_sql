select count(distinct UserID) from ( 
select
    l.DeviceID as DeviceID,
    l.Source as Source,
    r.UserID as UserID,
    r.count_users as count_users
from
    (
    select 
        l.DeviceID as DeviceID,
        l.Source as Source,
        r.UserID as UserID
    from installs as l
    join devices as r
        on l.DeviceID = r.DeviceID
    ) as l
    
join 
    (
        select  count(DISTINCT UserID) as count_users, UserID
        from checks 
        group by UserID
    ) as r
        on l.UserID = r.UserID

where Source = 'Source_7'
)
