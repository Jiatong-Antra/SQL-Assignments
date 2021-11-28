-- List of StockItems that the company purchased more than sold in the year of 2015

USE WideWorldImporters;

SELECT DISTINCT SD.StockItemName
FROM (
	SELECT S.StockItemName, ST.StockItemID, SUM(ST.Quantity) AS Quantity_Sold
	FROM Warehouse.StockItemTransactions AS ST
	JOIN Warehouse.StockItems AS S ON S.StockItemID = ST.StockItemID
	WHERE ST.Quantity < 0 AND YEAR(ST.TransactionOccurredWhen) = 2015
	GROUP BY S.StockItemName, ST.StockItemID
) SD

JOIN (
	SELECT S.StockItemName, ST.StockItemID, SUM(ST.Quantity) AS Quantity_Purchased
	FROM Warehouse.StockItemTransactions AS ST
	JOIN Warehouse.StockItems AS S ON S.StockItemID = ST.StockItemID
	WHERE ST.Quantity >0 AND YEAR(ST.TransactionOccurredWhen) = 2015
	GROUP BY S.StockItemName, ST.StockItemID
) SP
ON SD.StockItemID = SP.StockItemID
WHERE SP.Quantity_Purchased + SD.Quantity_Sold > 0



