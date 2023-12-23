
with 
country as(

    select * from {{ref("stg_country")}}
)

, device as (
SELECT * from {{ref("stg_device")}}
)

, medium as (
select * from {{ref("stg_medium")}}
)

, events as (
select  ga_session_id as ga_session_id , event_name
,event_timestamp as event_timestamp, user_pseudo_id
  from  {{ source('jaffle_shop', 'ga4_events') }} 
  group by 1,2,3,4

)

select e.*,c.country,d.browser,m.session_medium  from 
events e 
left join country c on c.user_pseudo_id=e.user_pseudo_id
left join device d on d.user_pseudo_id=e.user_pseudo_id
left join medium m on m.user_pseudo_id=e.user_pseudo_id