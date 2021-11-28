-- List of stock items that are not sold to the state of Alabama and Georgia in 2014.

USE WideWorldImporters;

SELECT DISTINCT SI.StockItemName
FROM Warehouse.StockItems AS SI
JOIN Sales.OrderLines AS OL ON SI.StockItemID = OL.StockItemID
JOIN Sales.Orders AS O ON OL.OrderID = O.OrderID
JOIN Sales.Customers AS C ON O.CustomerID = C.CustomerID
JOIN Application.Cities AS CY ON C.DeliveryCityID = CY.CityID
JOIN Application.StateProvinces AS SP ON CY.StateProvinceID = SP.StateProvinceID 
WHERE YEAR(O.OrderDate) = 2014 AND SP.StateProvinceName != 'Alabama' AND SP.StateProvinceName != 'Georgia'



