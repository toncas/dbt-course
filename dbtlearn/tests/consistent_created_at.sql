WITH fct_reviews AS (
    SELECT * FROM {{ ref('fct_reviews') }}
),
dim_listings_cleansed AS (
    SELECT * FROM {{ ref('dim_listings_cleansed') }}
)

SELECT 
    fct_reviews.review_date,
    dim_listings_cleansed.created_at
FROM 
    fct_reviews
JOIN 
    dim_listings_cleansed
ON 
    fct_reviews.listing_id = dim_listings_cleansed.listing_id
WHERE 
    fct_reviews.review_date <= dim_listings_cleansed.created_at