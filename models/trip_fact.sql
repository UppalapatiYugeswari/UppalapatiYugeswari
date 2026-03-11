{{config(materialized='table')}}
with bike as(
    select 
    ride_id,
   -- RIDEABLE_TYPE,
    date(to_timestamp(started_at)) as trip_date,
    start_station_id,
    END_STATION_ID,
    member_casual,
    timestampdiff(second,to_timestamp(started_at),to_timestamp(ended_at)) as trip_duration_seconds
    from {{ ref('stg_bike') }}
    where ride_id!='ride_id'
    
)
select * from bike