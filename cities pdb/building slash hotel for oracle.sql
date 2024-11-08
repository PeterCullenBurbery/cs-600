CREATE TABLE building (
    x                       NUMBER,
    y                       NUMBER,
    building                VARCHAR
    (4000),
    address                 VARCHAR
    (2000),
    phone                   VARCHAR
    (50),
    number_of_rooms         NUMBER(*,
    0) CHECK ( number_of_rooms > 0 )
    ,
    web_url                 VARCHAR
    (4000),
    gis_id                  VARCHAR
    (50),
    object_id               NUMBER(*,
    0),
    zip_code                NUMBER(*,
    0),
    x_coordinate            NUMBER,
    y_coordinate            NUMBER,
    mar_id                  NUMBER(*,
    0),
    global_id               VARCHAR
    (100),
    city_id                 RAW(16)
        REFERENCES CITY_NORMALIZED_WITHOUT_EXTRA_COLUMNS ( CITY_NORMALIZED_WITHOUT_EXTRA_COLUMNS_id )
        ,
    -- Additional columns for note and dates
    date_created            TIMESTAMP
    (9) WITH TIME ZONE DEFAULT systimestamp
    (9) NOT NULL,
    date_updated            TIMESTAMP
    (9) WITH TIME ZONE,
        date_created_or_updated TIMESTAMP
        (9) WITH TIME ZONE GENERATED
        ALWAYS AS ( coalesce(date_updated
        , date_created) ) VIRTUAL,
    building_id             RAW(16)
    DEFAULT sys_guid() PRIMARY KEY
);

-- Trigger to update date_updated for BUILDING
CREATE OR REPLACE TRIGGER set_date_updated_building
BEFORE
    UPDATE ON building
    FOR EACH ROW
BEGIN
    :new.date_updated := systimestamp
    ;
END;
/