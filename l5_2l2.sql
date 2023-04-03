create table test.reviews (
    listing_id UInt32,
    id UInt32,
    created_at DateTime('Europe/Moscow'),
    reviewer_id UInt32,
    reviewer_name String,
    comments String

) engine = MergeTree
order by (listing_id, id)
