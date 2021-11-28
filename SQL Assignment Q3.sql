-- List of customers to whom we made a sale prior to 2016 but no sale since 2016-01-01.

USE WideWorldImporters;

SELECT C.CustomerName
FROM Sales.Customers AS C
JOIN Sales.CustomerTransactions AS CT
ON C.CustomerID = CT.CustomerID
GROUP BY C.CustomerName
HAVING MAX(CT.TransactionDate) < '2016-01-01'



