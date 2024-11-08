-- Create County Table
CREATE TABLE County (
    County NVARCHAR(4000),
    CountyFIPS BIGINT CHECK (CountyFIPS >= 0),
    
    -- Additional columns for note and dates
    DateCreated DATETIMEOFFSET DEFAULT SYSUTCDATETIME() NOT NULL,
    DateUpdated DATETIMEOFFSET NULL,
    DateCreatedOrUpdated AS (COALESCE(DateUpdated, DateCreated)) PERSISTED,
    
    CountyID UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY
);
GO
-- Trigger to update DateUpdated for County
CREATE TRIGGER trg_SetDateUpdated_County
ON County
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE County
    SET DateUpdated = SYSUTCDATETIME()
    FROM County
    INNER JOIN Inserted ON County.CountyID = Inserted.CountyID;
END;
GO

-- Create State Table
CREATE TABLE State (
    State NVARCHAR(4000),
    StateAbbreviation NVARCHAR(2),
    Note NVARCHAR(4000), -- General-purpose note field
    
    -- Additional columns for note and dates
    DateCreated DATETIMEOFFSET DEFAULT SYSUTCDATETIME() NOT NULL,
    DateUpdated DATETIMEOFFSET NULL,
    DateCreatedOrUpdated AS (COALESCE(DateUpdated, DateCreated)) PERSISTED,
    
    StateID UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY
);
GO
-- Trigger to update DateUpdated for State
CREATE TRIGGER trg_SetDateUpdated_State
ON State
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE State
    SET DateUpdated = SYSUTCDATETIME()
    FROM State
    INNER JOIN Inserted ON State.StateID = Inserted.StateID;
END;
GO

-- Create City Table
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
    DateCreated DATETIMEOFFSET DEFAULT SYSUTCDATETIME() NOT NULL,
    DateUpdated DATETIMEOFFSET NULL,
    DateCreatedOrUpdated AS (COALESCE(DateUpdated, DateCreated)) PERSISTED,
    
    CityID UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
    StateID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES State(StateID),
    CountyID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES County(CountyID)
);
GO
-- Trigger to update DateUpdated for City
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
GO
