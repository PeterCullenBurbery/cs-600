insert into city 
(
City, City_Ascii, Latitude, Longitude, Population, Density, Source, Military, Incorporated, Timezone, Ranking, Zips, ID, DateCreated, DateUpdated, City_ID, State_ID, County_ID
)
select CITY, CITY_ASCII, LAT, LNG, POPULATION, DENSITY, SOURCE, MILITARY, INCORPORATED, TIMEZONE, RANKING, ZIPS, ID,     TRY_CAST(
        REPLACE(
            LEFT([DATE_CREATED], 19), '.', ':'
        ) + SUBSTRING([DATE_CREATED], 20, LEN([DATE_CREATED]))
        AS DATETIMEOFFSET
    ) AS FormattedDateCreated,
    TRY_CAST(
        REPLACE(
            LEFT([DATE_UPDATED], 19), '.', ':'
        ) + SUBSTRING([DATE_UPDATED], 20, LEN([DATE_UPDATED]))
        AS DATETIMEOFFSET
    ) AS FormattedDateUpdated,
    CAST(
        STUFF(STUFF(STUFF(STUFF([CITY_NORMALIZED_WITHOUT_EXTRA_COLUMNS_ID], 9, 0, '-'), 14, 0, '-'), 19, 0, '-'), 24, 0, '-') 
        AS UNIQUEIDENTIFIER
    ) AS city_ID,     CAST(
        STUFF(STUFF(STUFF(STUFF([state_ID], 9, 0, '-'), 14, 0, '-'), 19, 0, '-'), 24, 0, '-') 
        AS UNIQUEIDENTIFIER
    ) AS state_ID,     CAST(
        STUFF(STUFF(STUFF(STUFF([county_ID], 9, 0, '-'), 14, 0, '-'), 19, 0, '-'), 24, 0, '-') 
        AS UNIQUEIDENTIFIER
    ) AS county_ID from [dbo].[city import];