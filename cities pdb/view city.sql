CREATE OR REPLACE VIEW comprehensive_view_city AS
    SELECT
        city.city                                     city,
        city.city_ascii                               city_ascii,
        city.lat                                      lat,
        city.lng                                      lng,
        city.population                               population,
        city.density                                  density,
        city.source                                   source,
        city.military                                 military,
        city.incorporated                             incorporated,
        city.timezone                                 timezone,
        city.ranking                                  ranking,
        city.zips                                     zips,
        city.id                                       id,
        city.date_created                             date_created,
        city.date_updated                             date_updated,
        city.date_created_or_updated                  date_created_or_updated,
        city.city_normalized_without_extra_columns_id city_normalized_without_extra_columns_id,
        city.state_id                                 state_id,
        city.county_id                                county_id,
        state.state                                   state,
        state.state_abbreviation                      state_abbreviation,
        state.date_created                            date_created_0,
        state.date_updated                            date_updated_1,
        state.date_created_or_updated                 date_created_or_updated_2,
        state.state_id                                state_id,
        county.county                                 county,
        county.county_fips                            county_fips,
        county.date_created                           date_created_3,
        county.date_updated                           date_updated_4,
        county.date_created_or_updated                date_created_or_updated_5,
        county.county_id                              county_id_6
    FROM
             city_normalized_without_extra_columns city
        JOIN state ON state.state_id = city.state_id
        JOIN county ON county.county_id = city.county_id;

CREATE OR REPLACE VIEW view_city AS
    SELECT
        city.city                                     city,
        city.city_ascii                               city_ascii,
        state.state                                   state,
        state.state_abbreviation                      state_abbreviation,
        county.county                                 county,
        county.county_fips                            county_fips,
        city.lat                                      lat,
        city.lng                                      lng,
        city.population                               population,
        city.density                                  density,
        city.source                                   source,
        city.military                                 military,
        city.incorporated                             incorporated,
        city.timezone                                 timezone,
        city.ranking                                  ranking,
        city.zips                                     zips,
        city.id                                       id,
        city.date_created                             date_created,
        city.date_updated                             date_updated,
        city.date_created_or_updated                  date_created_or_updated,
        city.city_normalized_without_extra_columns_id city_normalized_without_extra_columns_id,
        city.state_id                                 state_id,
        city.county_id                                county_id,
        state.date_created                            date_created_0,
        state.date_updated                            date_updated_1,
        state.date_created_or_updated                 date_created_or_updated_2,
        state.state_id                                state_id,
        county.date_created                           date_created_3,
        county.date_updated                           date_updated_4,
        county.date_created_or_updated                date_created_or_updated_5,
        county.county_id                              county_id_6
    FROM
             city_normalized_without_extra_columns city
        JOIN state ON state.state_id = city.state_id
        JOIN county ON county.county_id = city.county_id;