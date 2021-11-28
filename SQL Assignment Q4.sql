-- List of Stock Items and total quantity for each stock item in Purchase Orders in Year 2013.

USE WideWorldImporters;

SELECT SI.StockItemName, SUM(POL.OrderedOuters) AS Toatl_Quantity
FROM Purchasing.PurchaseOrders AS PO
JOIN Purchasing.PurchaseOrderLines AS POL ON PO.PurchaseOrderID = POL.PurchaseOrderID
JOIN Warehouse.StockItems AS SI ON POL.StockItemID = SI.StockItemID
WHERE YEAR(PO.OrderDate) = 2013
GROUP BY SI.StockItemName
