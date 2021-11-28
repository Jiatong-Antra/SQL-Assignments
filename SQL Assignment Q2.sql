-- If the customer's primary contact person has the same phone number as the customer’s phone number, 
-- list the customer companies.
USE WideWorldImporters;

SELECT C.CustomerName
FROM Sales.Customers AS C
JOIN Application.People AS P
ON C.PrimaryContactPersonID = P.PersonID AND C.PhoneNumber = P.PhoneNumber;