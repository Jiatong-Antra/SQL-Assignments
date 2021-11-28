-- List all the Order Detail 
-- (Stock Item name, delivery address, delivery state, city, country, customer name, 
-- customer contact person name, customer phone, quantity) 
-- for the date of 2014-07-01. Info should be relevant to that date

USE WideWorldImporters;

SELECT S.StockItemName, 
	I.DeliveryInstructions AS Delivery_Address, 
	SP.StateProvinceName AS Delivery_State, 
	CT.CityName AS City, 
	CY.CountryName AS Country, 
	C.CustomerName, 
	P.FullName AS Customer_Contact_Person,
	C.PhoneNumber AS Customer_Phone,
	OL.Quantity
FROM Sales.OrderLines AS OL
JOIN Warehouse.StockItems AS S ON S.StockItemID = OL.StockItemID
JOIN Sales.Invoices AS I ON I.OrderID = OL.OrderID
JOIN Sales.Customers AS C ON C.CustomerID = I.CustomerID
JOIN Application.Cities AS CT ON CT.CityID = C.PostalCityID
JOIN Application.StateProvinces AS SP ON SP.StateProvinceID = CT.StateProvinceID
JOIN Application.Countries AS CY ON CY.CountryID = SP.CountryID
JOIN Application.People AS P ON P.PersonID = C.PrimaryContactPersonID
JOIN Sales.Orders AS O ON O.OrderID = OL.OrderID
WHERE O.OrderDate = '2014-07-01';

