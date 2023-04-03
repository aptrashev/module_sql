with
    (select 
        avg(creviewer) as avgreviewer
    from
        (
        select 
            listing_id,
            count(distinct reviewer_id) as creviewer
        from reviews
        group by listing_id
        )) as avgreviewer 

select
    l.listing_id,
    cr
from
    (
    select
        listing_id
    from calendar_summary
    where available !='f'
    ) as l
join 
    (
    SELECT
        count(distinct reviewer_id) as cr,
        listing_id
    from reviews
    group by listing_id
    )as r
        using(listing_id)
where cr > avgreviewer
order by listing_id
limit 10
