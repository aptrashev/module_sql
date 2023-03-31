select
    host_id,
    groupArray(id) as ids,
    max(toFloat32OrNull(replaceRegexpAll(price, '[$,]',''))) - min(toFloat32OrNull(replaceRegexpAll(price, '[$,]',''))) as dff
from listings
group by host_id
order by dff desc
limit 100
