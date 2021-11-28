-- List all stock items that are manufactured in China. (Country of Manufacture)

USE WideWorldImporters;

SELECT SI.StockItemName 
FROM Warehouse.StockItems AS SI
WHERE JSON_VALUE(SI.CustomFields, '$.CountryOfManufacture') = 'China'