select DeviceID, toMonth(BuyDate::date) as BuyDate
from (

select
    l.DeviceID as DeviceID,
    l.Source as Source,
    r.UserID as UserID,
    r.BuyDate as BuyDate
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
        select UserID, BuyDate::date as BuyDate
        from checks 
    ) as r
        on l.UserID = r.UserID
)

where BuyDate >= 10 and BuyDate < 11
order by DeviceID
