CREATE TABLE room (
    room_number             NUMBER(*,
    0) CHECK ( room_number >= 0 ),
    building_id             RAW(16)
        REFERENCES building ( building_id
        ),
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
    room_id                 RAW(16)
    DEFAULT sys_guid() PRIMARY KEY
);

-- Trigger to update date_updated for ROOM
CREATE OR REPLACE TRIGGER set_date_updated_room
BEFORE
    UPDATE ON room
    FOR EACH ROW
BEGIN
    :new.date_updated := systimestamp
    ;
END;
/