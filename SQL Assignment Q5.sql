-- List of stock items that have at least 10 characters in description.

USE WideWorldImporters;

SELECT StockItemName
FROM Warehouse.StockItems 
WHERE LEN(StockItemName) >= 10
