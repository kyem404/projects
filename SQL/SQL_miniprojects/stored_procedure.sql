--first stored procedure
ALTER PROCEDURE GetCustomerSummary @Country NVARCHAR(50) = 'USA'
AS
BEGIN

DECLARE @TotalCustomers INT, @AvgScore FLOAT;


select
	@TotalCustomers = count(*),
	@AvgScore = avg(score)
from Sales.Customers
where Country = @Country;

PRINT 'TotalCustomers from ' + @Country + ':' + CAST(@TotalCustomers as NVARCHAR);
PRINT 'Average Score from ' + @Country +  ':' + CAST(@AvgScore as NVARCHAR);


select
	count(orderid) total_orders,
	sum(sales) total_sales
from sales.orders o
join sales.customers c
on c.customerID = o.customerID
where c.Country = @Country;


END
