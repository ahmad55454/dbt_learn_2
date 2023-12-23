with 
medium as (
  SELECT user_pseudo_id,session_medium  FROM {{ source('jaffle_shop', 'ga4_events') }} group by 1,2 

)

select * from medium