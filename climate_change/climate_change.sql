select * from state_climate;

select state, year, tempf, avg(tempf) over (partition by state order by year) as running_avg_temp from state_climate;

select state, year, tempf, first_value(tempf) over (partition by state order by tempf desc) lowest_temp from state_climate;

select state, year, tempf, last_value(tempf) over (partition by state order by tempf range between unbounded preceding and unbounded following) lowest_temp from state_climate;

select state, year, tempf, lag(tempf, 1,0) over (partition by state order by year) as prev_year_temp,tempf - lag(tempf, 1,0) over (partition by state order by year) as change_in_temp from state_climate;

select state, year, tempf, rank() over (order by tempf desc) coldest_rank from state_climate;

select ntile(4) over (order by tempf) quartile, state, year,tempf from state_climate;