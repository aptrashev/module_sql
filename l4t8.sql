select
    room_type,
    avg(toFloat32OrNull(replaceRegexpAll(price, '[$,]',''))) as avg_price_per_night,
    avg(toFloat32OrNull(replaceRegexpAll(security_deposit, '[$,]',''))) as security_deposit,
    avg(toFloat32OrNull(replaceRegexpAll(cleaning_fee, '[$,]',''))) as cleaning_fee
from listings
group by room_type
limit 100
