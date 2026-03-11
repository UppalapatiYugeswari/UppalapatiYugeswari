{{config(materialized='table')}}
with bike as(
    select 
    distinct
    start_station_id as station_id,
    start_station_name as station_name,
    start_lat as satation_lat,
    start_lng as start_station_lng
    from {{ ref('stg_bike') }}
    where ride_id!='ride_id'
    
)
select * from bike