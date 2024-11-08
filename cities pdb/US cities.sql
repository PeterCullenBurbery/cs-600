CREATE TABLE US_CITY (
    CITY            VARCHAR2(4000),
	CITY_ASCII VARCHAR(4000),
	STATE_ID VARCHAR(50),
	STATE_NAME VARCHAR(1000),
	COUNTY_FIPS NUMBER(*,0) CHECK (COUNTY_FIPS>=0),
	COUNTY_NAME VARCHAR(1000),
	LAT NUMBER,
	LNG NUMBER,
	POPULATION NUMBER(*,0),
	DENSITY NUMBER,
	SOURCE VARCHAR(50),
	MILITARY VARCHAR(50),
	INCORPORATED VARCHAR(50),
	TIMEZONE VARCHAR(1000),
	RANKING NUMBER(*,0),
	ZIPS VARCHAR(4000),
	ID NUMBER(*,0),
    -- Additional columns for note and dates
    note                   VARCHAR2(4000),  -- General-purpose note field
    date_created           TIMESTAMP(9) WITH TIME ZONE DEFAULT systimestamp(9) NOT NULL,
    date_updated           TIMESTAMP(9) WITH TIME ZONE,
    date_created_or_updated TIMESTAMP(9) WITH TIME ZONE GENERATED ALWAYS AS ( coalesce(date_updated, date_created) ) VIRTUAL,
    US_CITY_id         RAW(16) DEFAULT sys_guid() PRIMARY KEY
);

-- Trigger to update date_updated for US_CITY
CREATE OR REPLACE TRIGGER set_date_updated_US_CITY
    BEFORE UPDATE ON US_CITY
    FOR EACH ROW
BEGIN
    :new.date_updated := systimestamp;
END;
/
