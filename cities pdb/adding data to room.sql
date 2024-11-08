SELECT
    building,
    number_of_rooms,
    date_created,
    date_updated,
    date_created_or_updated,
    building_id
FROM
    building;

SELECT
    *
FROM
    building
WHERE
    number_of_rooms IS NOT NULL;

SELECT
    *
FROM
    building
WHERE
    number_of_rooms IS NULL;

SELECT
    COUNT(*)
FROM
    building
WHERE
    number_of_rooms IS NOT NULL;

SELECT
    COUNT(*)
FROM
    building
WHERE
    number_of_rooms IS NULL;

CREATE OR REPLACE VIEW buildings_where_number_of_rooms_is_not_null
AS
    SELECT
        building,
        number_of_rooms,
        building_id
    FROM
        building
    WHERE
        number_of_rooms IS NOT NULL
        ;

SELECT
    *
FROM
    buildings_where_number_of_rooms_is_not_null
    ;

SELECT
    *
FROM
    buildings_where_number_of_rooms_is_not_null
WHERE
    building IS NULL;

CREATE OR REPLACE VIEW buildings_where_number_of_rooms_is_not_null_and_building_is_not_null
AS
    SELECT
        *
    FROM
        buildings_where_number_of_rooms_is_not_null
    WHERE
        building IS NOT NULL;

SELECT
    *
FROM
    buildings_where_number_of_rooms_is_not_null_and_building_is_not_null
    ;

SELECT
    SUM(number_of_rooms)
FROM
    buildings_where_number_of_rooms_is_not_null_and_building_is_not_null
    ;

DECLARE
    v_building_id RAW(16);
    v_number_of_rooms NUMBER;
    v_room_number NUMBER;
    
    -- Cursor to iterate through the buildings with non-null building and number_of_rooms
    CURSOR building_cursor IS
        SELECT building_id, number_of_rooms
        FROM buildings_where_number_of_rooms_is_not_null_and_building_is_not_null;

BEGIN
    -- Loop through each building
    FOR building_record IN building_cursor LOOP
        v_building_id := building_record.building_id;
        v_number_of_rooms := building_record.number_of_rooms;

        -- Insert rooms for the current building
        v_room_number := 1; -- Start from room number 1
        WHILE v_room_number <= v_number_of_rooms LOOP
            INSERT INTO room (room_number, building_id)
            VALUES (v_room_number, v_building_id);

            v_room_number := v_room_number + 1; -- Increment room number
        END LOOP;
    END LOOP;

    -- Commit the transaction to save changes
    COMMIT;
END;
/
