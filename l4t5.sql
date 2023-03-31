select
    avg(toInt32OrNull(replaceAll(host_response_rate, '%', '')))as host_response_rate,
    host_is_superhost
    
from 
    (
    select
        distinct host_id,
        host_response_rate,
        host_is_superhost
    from listings
    ) as sub
group by host_is_superhost
order by host_response_rate desc
limit 100

