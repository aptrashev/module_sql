select 
    id,
    host_id,
    room_type,
    toFloat64OrNull(replaceRegexpAll(price, '[$,]','')) as price ,
    toFloat64OrNull(replaceRegexpAll(cleaning_fee, '[$,]', '')) as cleaning_fee,
    last_review,
    amenities,
    toFloat64OrNull(review_scores_rating) as review_scores_rating,
    geoDistance(13.4050, 52.5200,toFloat64OrNull(longitude),toFloat64OrNull(latitude)) as d
from listings
where 
    d < (select avg(geoDistance(13.4050, 52.5200,toFloat64OrNull(longitude),toFloat64OrNull(latitude))) as d from listings where room_type = 'Private room' )
    and (price + cleaning_fee) / 7 < 100
    and last_review >= '2018-09-01'
    and multiSearchAnyCaseInsensitive(amenities,['Wifi'])
order by review_scores_rating desc
limit 100
