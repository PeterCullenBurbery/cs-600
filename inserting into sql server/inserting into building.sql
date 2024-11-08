insert into [dbo].[Building]
(
x, y, building, address, phone, number_of_rooms, web_url, gis_id, object_id, zip_code, x_coordinate, y_coordinate, mar_id, global_id, city_id, date_created, date_updated,  building_id
)
select X, Y, BUILDING, ADDRESS, PHONE, NUMBER_OF_ROOMS, WEB_URL, GIS_ID, OBJECT_ID, ZIP_CODE, X_COORDINATE, Y_COORDINATE, MAR_ID, GLOBAL_ID, CAST(
        STUFF(STUFF(STUFF(STUFF([CITY_ID], 9, 0, '-'), 14, 0, '-'), 19, 0, '-'), 24, 0, '-') 
        AS UNIQUEIDENTIFIER
    ) AS CITY_ID, TRY_CAST(
        REPLACE(
            LEFT([DATE_CREATED], 19), '.', ':'
        ) + SUBSTRING([DATE_CREATED], 20, LEN([DATE_CREATED]))
        AS DATETIMEOFFSET
    ) AS FormattedDateCreated,     TRY_CAST(
        REPLACE(
            LEFT([DATE_UPDATED], 19), '.', ':'
        ) + SUBSTRING([DATE_UPDATED], 20, LEN([DATE_UPDATED]))
        AS DATETIMEOFFSET
    ) AS FormattedDateUpdated, CAST(
        STUFF(STUFF(STUFF(STUFF([BUILDING_ID], 9, 0, '-'), 14, 0, '-'), 19, 0, '-'), 24, 0, '-') 
        AS UNIQUEIDENTIFIER
    ) AS BUILDING_ID from
[dbo].[building import];