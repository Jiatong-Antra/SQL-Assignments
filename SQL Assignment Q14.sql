-- List of Cities in the US and the stock item that the city got the most deliveries in 2016. 
-- If the city did not purchase any stock items in 2016, print “No Sales”

USE WideWorldImporters;

WITH CTE (Stock_Item_Name, City_ID, Total_Sales, Ranking) 
AS(
	SELECT OL.Description AS Stock_Item_Name, C.PostalCityID, SUM(OL.Quantity) AS Total_Sale,
	RANK() OVER (PARTITION BY C.PostalCityID ORDER BY SUM(OL.Quantity) DESC) AS RK
	FROM Sales.OrderLines AS OL
	JOIN Sales.Orders AS O ON O.OrderID = OL.OrderID
	JOIN Sales.Customers AS C ON C.CustomerID = O.CustomerID
	WHERE YEAR(O.OrderDate) = 2016
	GROUP BY OL.Description, C.PostalCityID
	)

SELECT CT.CityName, 
	ISNULL(CTE.Stock_Item_Name, 'No Sales') AS Stock_Item_Name 
FROM CTE
JOIN Application.Cities AS CT ON CT.CityID = CTE.City_ID
JOIN Application.StateProvinces AS SP ON SP.StateProvinceID = CT.StateProvinceID
JOIN Application.Countries AS CY ON CY.CountryID = SP.CountryID
WHERE CY.CountryName = 'United States'
AND CTE.Ranking = 1
GROUP BY CT.CityName, CTE.Stock_Item_Name



