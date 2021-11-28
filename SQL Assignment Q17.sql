-- Total quantity of stock items sold in 2015, group by country of manufacturing

USE WideWorldImporters;

SELECT  SUM(ABS(ST.Quantity)) AS Total_Quantity, 
	JSON_VALUE(SI.CustomFields, '$.CountryOfManufacture') AS Country_Of_Manufacturing
FROM Warehouse.StockItemTransactions AS ST
JOIN Warehouse.StockItems AS SI ON SI.StockItemID = ST.StockItemID
WHERE YEAR(ST.TransactionOccurredWhen) = 2015
AND ST.Quantity < 0
GROUP BY JSON_VALUE(SI.CustomFields, '$.CountryOfManufacture')



