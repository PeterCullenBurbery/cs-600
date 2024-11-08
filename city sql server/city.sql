CREATE TABLE City (
    City NVARCHAR(4000),
    CityAscii NVARCHAR(4000),
    Latitude FLOAT,
    Longitude FLOAT,
    Population BIGINT,
    Density FLOAT,
    Source NVARCHAR(50),
    Military NVARCHAR(50),
    Incorporated NVARCHAR(50),
    Timezone NVARCHAR(1000),
    Ranking INT,
    Zips NVARCHAR(4000),
    ID BIGINT,
    
    -- Additional columns for note and dates
    DateCreated DATETIME2 DEFAULT SYSUTCDATETIME() NOT NULL,
    DateUpdated DATETIME2 NULL,
    DateCreatedOrUpdated AS (COALESCE(DateUpdated, DateCreated)) PERSISTED,
    
    CityID UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
    StateID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES State(StateID),
    CountyID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES County(CountyID)
);
go
-- Trigger to update DateUpdated on update
CREATE TRIGGER trg_SetDateUpdated_City
ON City
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE City
    SET DateUpdated = SYSUTCDATETIME()
    FROM City
    INNER JOIN Inserted ON City.CityID = Inserted.CityID;
END;
