-- List of Customers and their phone number, 
-- together with the primary contact person’s name, 
-- to whom we did not sell more than 10  mugs (search by name) in the year 2016

USE WideWorldImporters;

SELECT C.CustomerName, C.PhoneNumber, P.FullName AS Primary_Contact_Person
FROM Sales.Customers AS C 
JOIN Sales.Orders AS O ON O.CustomerID = C.CustomerID
JOIN Sales.OrderLines AS OL ON OL.OrderID = O.OrderID
JOIN Application.People AS P ON P.PersonID = C.PrimaryContactPersonID
WHERE C.CustomerID IN 
	(
	SELECT MUG.CustomerID
	FROM (
		SELECT C.CustomerID, SUM(OL.Quantity) AS Quantity_Sell
		FROM Sales.Customers AS C
		JOIN Sales.Orders AS O ON O.CustomerID = C.CustomerID
		JOIN Sales.OrderLines AS OL ON OL.OrderID = O.OrderID
		WHERE OL.Description LIKE '%mug%'
		AND YEAR(O.OrderDate) = 2016
		GROUP BY C.CustomerID
		HAVING SUM(OL.Quantity) <= 10
		) MUG
	)
GROUP BY C.CustomerName, C.PhoneNumber, P.FullName;
