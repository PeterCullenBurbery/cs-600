CREATE TABLE STATE (
    STATE            VARCHAR2(4000),
    state_abbreviation varchar2(2),
    -- Additional columns for note and dates
    note                   VARCHAR2(4000),  -- General-purpose note field
    date_created           TIMESTAMP(9) WITH TIME ZONE DEFAULT systimestamp(9) NOT NULL,
    date_updated           TIMESTAMP(9) WITH TIME ZONE,
    date_created_or_updated TIMESTAMP(9) WITH TIME ZONE GENERATED ALWAYS AS ( coalesce(date_updated, date_created) ) VIRTUAL,
    STATE_id         RAW(16) DEFAULT sys_guid() PRIMARY KEY
);

-- Trigger to update date_updated for STATE
CREATE OR REPLACE TRIGGER set_date_updated_STATE
    BEFORE UPDATE ON STATE
    FOR EACH ROW
BEGIN
    :new.date_updated := systimestamp;
END;
/
