-- Add additional nullable columns to AspNetUsers table
ALTER TABLE [dbo].[AspNetUsers]
ADD 
    [Birthdate]             DATETIMEOFFSET(7) NULL,                        -- Birthdate, nullable for flexibility
    [Age]                   AS DATEDIFF(YEAR, Birthdate, SYSDATETIMEOFFSET()), -- Virtual column for age
    [FirstName]             NVARCHAR(50) NULL,                             -- First name, nullable
    [MiddleName]            NVARCHAR(50) NULL,                             -- Middle name, nullable
    [SecondMiddleName]      NVARCHAR(50) NULL,                             -- Second middle name, nullable
    [LastName]              NVARCHAR(50) NULL,                             -- Last name, nullable
    [Suffix]                NVARCHAR(10) NULL,                             -- Suffix, nullable
    [Address]               NVARCHAR(255) NULL,                            -- Address, nullable
    [ZipCode]               NVARCHAR(10) NULL,                             -- Zip code, nullable
    [DateCreated]           DATETIMEOFFSET(7) DEFAULT SYSDATETIMEOFFSET(), -- Creation timestamp, nullable
    [DateUpdated]           DATETIMEOFFSET(7) NULL,                        -- Update timestamp, nullable
    [DateCreatedOrUpdated]  AS COALESCE(DateUpdated, DateCreated)          -- Virtual column for created or updated date
;


-- Optional: Add unique constraints if needed
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserEmail] 
    ON [dbo].[AspNetUsers] ([Email] ASC);

CREATE UNIQUE NONCLUSTERED INDEX [IX_UserAddressZipCode]
    ON [dbo].[AspNetUsers] ([Address] ASC, [ZipCode] ASC);


