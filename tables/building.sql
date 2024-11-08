-- Create Building Table
CREATE TABLE Building (
    building NVARCHAR(255) NOT NULL,               -- Name of the building, e.g., "big hotel"
    address NVARCHAR(255) NOT NULL,                -- Main address
    second_address NVARCHAR(255) NULL,             -- Optional second address
    city_id UNIQUEIDENTIFIER NOT NULL,             -- Foreign key to City table
    zip_code NVARCHAR(20) NOT NULL,                -- Zip code
    
    -- Additional columns for note and dates
    date_created DATETIME2 DEFAULT SYSUTCDATETIME() NOT NULL,  -- Date when record is created
    date_updated DATETIME2 NULL,                                -- Date when record is updated
    date_created_or_updated AS (COALESCE(date_updated, date_created)) PERSISTED, -- Auto-calculated
    
    building_id UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,   -- Primary key for the table

    -- Unique constraint to ensure address uniqueness
    CONSTRAINT UQ_Building UNIQUE (address, second_address, city_id, zip_code),

    -- Foreign key constraint
    CONSTRAINT FK_Building_City FOREIGN KEY (city_id) REFERENCES City (city_id)
);
GO

-- Trigger to update date_updated for Building
CREATE TRIGGER trg_SetDateUpdated_Building
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
