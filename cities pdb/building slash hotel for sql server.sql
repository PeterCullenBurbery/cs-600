-- Create Building Table
CREATE TABLE Building (
    x DECIMAL(18, 10),
    y DECIMAL(18, 10),
    building NVARCHAR(4000),
    address NVARCHAR(2000),
    phone NVARCHAR(50),
    number_of_rooms INT CHECK (number_of_rooms > 0),
    web_url NVARCHAR(4000),
    gis_id NVARCHAR(50),
    object_id INT,
    zip_code INT,
    x_coordinate DECIMAL(18, 10),
    y_coordinate DECIMAL(18, 10),
    mar_id INT,
    global_id NVARCHAR(100),
    city_id UNIQUEIDENTIFIER FOREIGN KEY REFERENCES City(city_id),

    -- Additional columns for note and dates
    date_created DATETIMEOFFSET(7) DEFAULT SYSUTCDATETIME() NOT NULL,
    date_updated DATETIMEOFFSET(7) NULL,
    date_created_or_updated AS COALESCE(date_updated, date_created) PERSISTED,

    building_id UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY
);
GO

-- Trigger to update date_updated for Building
CREATE TRIGGER trg_set_date_updated_building
ON Building
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Building
    SET date_updated = SYSUTCDATETIME()
    FROM Building
    INNER JOIN Inserted ON Building.building_id = Inserted.building_id;
END;
GO
