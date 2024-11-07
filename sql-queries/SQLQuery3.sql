CREATE TRIGGER trg_UpdateDateUpdated
ON [dbo].[AspNetUsers]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Update the DateUpdated column to the current date and time for modified records
    UPDATE [dbo].[AspNetUsers]
    SET DateUpdated = SYSDATETIMEOFFSET()
    WHERE Id IN (SELECT DISTINCT Id FROM Inserted);
END;
GO
