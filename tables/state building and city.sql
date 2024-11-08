CREATE TABLE State (
    StateID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    StateName NVARCHAR(50) NOT NULL,
    Abbreviation CHAR(2) NOT NULL,
    DateCreated DATETIME DEFAULT GETDATE(),
    DateUpdated DATETIME NULL,
    DateCreatedOrUpdated AS (ISNULL(DateUpdated, DateCreated)) PERSISTED
);
CREATE TABLE City (
    CityID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    CityName NVARCHAR(100) NOT NULL,
    StateID UNIQUEIDENTIFIER NOT NULL FOREIGN KEY REFERENCES State(StateID),
    DateCreated DATETIME DEFAULT GETDATE(),
    DateUpdated DATETIME NULL,
    DateCreatedOrUpdated AS (ISNULL(DateUpdated, DateCreated)) PERSISTED
);
CREATE TABLE Building (
    BuildingID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    AddressLine1 NVARCHAR(200) NOT NULL,            -- e.g., "1234 Charleston Avenue"
    AddressLine2 NVARCHAR(200) NULL,                -- e.g., "Apartment 548"
    CityID UNIQUEIDENTIFIER NOT NULL FOREIGN KEY REFERENCES City(CityID),
    ZipPostalCode NVARCHAR(20) NOT NULL,
    DateCreated DATETIME DEFAULT GETDATE(),
    DateUpdated DATETIME NULL,
    DateCreatedOrUpdated AS (ISNULL(DateUpdated, DateCreated)) PERSISTED
);
go
CREATE TRIGGER trg_State_UpdateDate
ON State
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE State
    SET DateUpdated = GETDATE()
    WHERE StateID IN (SELECT DISTINCT StateID FROM Inserted);
END;
go
CREATE TRIGGER trg_City_UpdateDate
ON City
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE City
    SET DateUpdated = GETDATE()
    WHERE CityID IN (SELECT DISTINCT CityID FROM Inserted);
END;

go
CREATE TRIGGER trg_Building_UpdateDate
ON Building
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Building
    SET DateUpdated = GETDATE()
    WHERE BuildingID IN (SELECT DISTINCT BuildingID FROM Inserted);
END;
