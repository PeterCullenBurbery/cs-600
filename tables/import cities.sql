CREATE TABLE ImportedCities (
    CityID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    CityName NVARCHAR(100) NOT NULL,                -- Matches 'city'
    CityAscii NVARCHAR(100) NULL,                   -- Matches 'city_ascii'
    StateID NVARCHAR(2) NOT NULL,                   -- Matches 'state_id' (abbreviated state code, e.g., 'NY')
    StateName NVARCHAR(100) NOT NULL,               -- Matches 'state_name'
    CountyFIPS INT NULL,                            -- Matches 'county_fips'
    CountyName NVARCHAR(100) NULL,                  -- Matches 'county_name'
    Latitude FLOAT NULL,                            -- Matches 'lat'
    Longitude FLOAT NULL,                           -- Matches 'lng'
    Population INT NULL,                            -- Matches 'population'
    Density INT NULL,                               -- Matches 'density'
    Source NVARCHAR(50) NULL,                       -- Matches 'source'
    Military BIT NULL,                              -- Matches 'military'
    Incorporated BIT NULL,                          -- Matches 'incorporated'
    Timezone NVARCHAR(100) NULL,                    -- Matches 'timezone'
    Ranking INT NULL,                               -- Matches 'ranking'
    Zips NVARCHAR(MAX) NULL,                        -- Matches 'zips'
    ExternalID BIGINT NULL,                         -- Matches 'id' (for external reference)
    DateCreated DATETIME DEFAULT GETDATE(),
    DateUpdated DATETIME NULL,
    DateCreatedOrUpdated AS (ISNULL(DateUpdated, DateCreated)) PERSISTED
);
go
CREATE TRIGGER trg_ImportedCities_UpdateDate
ON ImportedCities
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE ImportedCities
    SET DateUpdated = GETDATE()
    WHERE CityID IN (SELECT DISTINCT CityID FROM Inserted);
END;
