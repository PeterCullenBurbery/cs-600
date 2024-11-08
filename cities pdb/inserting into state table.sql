insert into state(state_abbreviation,state)
select distinct state_id,state_name from us_city;