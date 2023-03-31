select
    host_id,
    groupArray(id) as ids,
    avg(toFloat32OrNull(replaceRegexpAll(price, '[$,]',''))) as avg_price
from listings
group by host_id
order by avg_price desc
limit 100


