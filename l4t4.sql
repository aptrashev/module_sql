select
    count(distinct host_id) as host_id,
    toStartOfMonth(toDateOrNull(host_since)) as host_since

from listings

group by host_since
order by host_id desc
