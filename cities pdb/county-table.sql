CREATE TABLE county (
    county                  VARCHAR2(4000),
    county_fips             NUMBER(*, 0) CHECK ( county_fips >= 0 ),
    -- Additional columns for note and dates
    date_created            TIMESTAMP(9) WITH TIME ZONE DEFAULT systimestamp(9) NOT NULL,
    date_updated            TIMESTAMP(9) WITH TIME ZONE,
        date_created_or_updated TIMESTAMP(9) WITH TIME ZONE GENERATED ALWAYS AS ( coalesce(date_updated, date_created) ) VIRTUAL,
    county_id               RAW(16) DEFAULT sys_guid() PRIMARY KEY
);

-- Trigger to update date_updated for COUNTY
CREATE OR REPLACE TRIGGER set_date_updated_county BEFORE
    UPDATE ON county
    FOR EACH ROW
BEGIN
    :new.date_updated := systimestamp;
END;
/