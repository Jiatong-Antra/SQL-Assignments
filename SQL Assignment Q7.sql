-- List of States and Avg dates for processing (confirmed delivery date – order date).

USE WideWorldImporters;

SELECT SP.StateProvinceName, AVG(DATEDIFF(DAY, O.OrderDate, I.ConfirmedDeliveryTime)) AS Avg_dates_processing
FROM SALES.Invoices AS I
JOIN Sales.Customers AS C ON I.CustomerID = C.CustomerID
JOIN Sales.Orders AS O ON O.OrderID = I.OrderID
JOIN Application.Cities AS CY ON C.DeliveryCityID = CY.CityID
JOIN Application.StateProvinces AS SP ON CY.StateProvinceID = SP.StateProvinceID 
GROUP BY SP.StateProvinceName
