CREATE TABLE CITY_NORMALIZED_WITHOUT_EXTRA_COLUMNS (
    CITY            VARCHAR2(4000),
	CITY_ASCII VARCHAR(4000),
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
    date_created           TIMESTAMP(9) WITH TIME ZONE DEFAULT systimestamp(9) NOT NULL,
    date_updated           TIMESTAMP(9) WITH TIME ZONE,
    date_created_or_updated TIMESTAMP(9) WITH TIME ZONE GENERATED ALWAYS AS ( coalesce(date_updated, date_created) ) VIRTUAL,
    CITY_NORMALIZED_WITHOUT_EXTRA_COLUMNS_id         RAW(16) DEFAULT sys_guid() PRIMARY KEY,
	STATE_ID RAW(16) REFERENCES STATE(STATE_ID),
    county_id raw(16) references count(county_id)
);

-- Trigger to update date_updated for CITY_NORMALIZED_WITHOUT_EXTRA_COLUMNS
CREATE OR REPLACE TRIGGER set_date_updated_CITY_NORMALIZED_WITHOUT_EXTRA_COLUMNS
    BEFORE UPDATE ON CITY_NORMALIZED_WITHOUT_EXTRA_COLUMNS
    FOR EACH ROW
BEGIN
    :new.date_updated := systimestamp;
END;
/
