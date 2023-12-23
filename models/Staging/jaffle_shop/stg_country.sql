with country as (
SELECT user_pseudo_id,country  FROM {{ source('jaffle_shop', 'ga4_events') }} group by 1,2 )

select * from country