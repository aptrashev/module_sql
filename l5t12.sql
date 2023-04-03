select 
    host_id,
    case
        when multiSearchAnyCaseInsensitive(amenities,['kitchen']) and cancellation_policy = 'flexible' then 'good'
        when multiSearchAnyCaseInsensitive(amenities,['kitchen']) and cancellation_policy != 'flexible' then 'ok'
        else 'not ok'
    end as idk
from listings
order by idk 
limit 5
