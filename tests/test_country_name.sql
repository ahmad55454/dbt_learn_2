with country_name as (select * from {{ref("stg_country")}})

select country, count(*) count_ from country_name group by 1 having count_<1