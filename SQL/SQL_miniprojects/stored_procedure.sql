-- Creating stored procedure in order to streamline repetitive tasks in SQL
ALTER PROCEDURE GetCustomerSummary @Country NVARCHAR(50) = 'USA'
AS

BEGIN
	BEGIN TRY

		DECLARE @TotalCustomers INT, @AvgScore FLOAT;


		-- Step 1: Prepare & Cleanup Data
		IF EXISTS (Select 1 from sales.customers where score IS NULL AND Country = @Country)
		BEGIN
			PRINT ('Updating NULL Scores to 0');
			UPDATE Sales.Customers
			SET Score = 0
			WHERE Score IS NULL AND Country = @Country;
		END

		ELSE
		BEGIN
			PRINT('No NULL Scores found')
		END;

		-- Step 2: Generating Summary Reports
		-- Calculate Total Customers and Average Score for specific Country
		select
			@TotalCustomers = count(*),
			@AvgScore = avg(score)
		from Sales.Customers
		where Country = @Country;


		PRINT 'TotalCustomers from ' + @Country + ':' + CAST(@TotalCustomers as NVARCHAR);
		PRINT 'Average Score from ' + @Country +  ':' + CAST(@AvgScore as NVARCHAR);


		-- Calculate Total Number of Orders and Total Sales for specific Country
		select
			count(orderid) total_orders,
			sum(sales) total_sales
		from sales.orders o
		join sales.customers c
		on c.customerID = o.customerID
		where c.Country = @Country;

	END TRY
	BEGIN CATCH
		-- Error Handling
		PRINT('An error occured.');
		PRINT('Error Message: ' + ERROR_MESSAGE());
		PRINT('Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR));
		PRINT('Error Line: ' + CAST(ERROR_LINE() AS NVARCHAR));
		PRINT('Error Procedure: ' + ERROR_PROCEDURE());
	END CATCH
END
GO
