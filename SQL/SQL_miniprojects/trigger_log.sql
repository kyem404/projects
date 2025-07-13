--Creating a log entry with a trigger every time data is inserted in the Employees table
CREATE TRIGGER trg_AfterInsertEmployee ON Sales.Employees
AFTER INSERT
AS
BEGIN
	INSERT INTO Sales.EmployeeLogs (EmployeeID, LogMessage, LogDate)
	SELECT
		EmployeeID,
		'New Employee Added =' + CAST(EmployeeID as VARCHAR),
		GETDATE()
	FROM INSERTED
END;
