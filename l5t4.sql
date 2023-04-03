select 
    id,
    toFloat64OrNull(review_scores_rating) as review_scores_rating,
    reviews_per_month
from listings
where 
    review_scores_rating > (select avg(toFloat64OrNull(review_scores_rating)) as review_scores_rating from listings) and reviews_per_month  < 3 
order by reviews_per_month desc, review_scores_rating desc
