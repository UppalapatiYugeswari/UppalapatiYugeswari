{{config(materialized='table')}}

with daily_weather as(
    
    select 

    date(time) as daily_weather,
    wheater,
    temp,
    pressure,
    humidity,
    clouds

    from {{ source('demo', 'weather') }}

),

daily_wheater_agg as(
    
    select
    daily_weather,
    wheater,
    round(avg(temp),2) as avg_temp,
    round(avg(pressure),2) as avg_pressure,
    round(avg(humidity),2) as avg_humidity,
    round(avg(clouds),2) as avg_clouds

    from daily_weather
    group by daily_weather,wheater
    qualify row_number()over(partition by daily_weather order by count(wheater) desc)=1

)



select * from daily_wheater_agg
--daily_wheater_agg daily_weather