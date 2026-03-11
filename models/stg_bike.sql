
{{config(materialized='table')}}
with bike as(
    select 
    ride_id ,
replace(started_at,'"','') as started_at ,
replace(ended_at,'"','') as ended_at ,
start_station_name,
start_station_id ,
end_station_name ,
end_station_id ,
start_lat ,
start_lng ,
end_lat ,
end_lng ,
member_casual 

    from {{ source('demo', 'bike') }}
    where ride_id!='"bike_id"' and STARTED_AT!='starttime'and STARTED_AT!='"starttime"'
)
select * from bike