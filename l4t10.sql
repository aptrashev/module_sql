select 
    --avg(toFloat32OrNull(replaceRegexpAll(price, '[$,]',''))) as avgprice,
    neighbourhood_cleansed,
    avg(toFloat32OrNull(square_feet)) as square_feet
from
    (
    select
        neighbourhood_cleansed,
        square_feet,
        room_type
    from listings
    where room_type = 'Entire home/apt'
    ) as test

group by neighbourhood_cleansed
order by square_feet desc
limit 3
