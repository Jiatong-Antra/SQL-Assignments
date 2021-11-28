-- List of stock item groups and total quantity purchased, total quantity sold, 
-- and the remaining stock quantity (quantity purchased – quantity sold)

USE WideWorldImporters;

WITH CTE1 (Stock_Item_Groups, Total_Quantity_Purchased)
AS
(
	SELECT SG.StockGroupName AS Stock_Item_Groups,
		SUM(POL.OrderedOuters) AS Total_Quantity_Purchased
		FROM Purchasing.PurchaseOrderLines AS POL
		JOIN Warehouse.StockItemStockGroups AS SSG ON SSG.StockItemID = POL.StockItemID
		JOIN Warehouse.StockGroups AS SG ON SG.StockGroupID = SSG.StockGroupID
		GROUP BY SG.StockGroupName
),  

 CTE2 (Stock_Item_Groups, Total_Quantity_Sold)
AS
(
	SELECT SG.StockGroupName AS Stock_Item_Groups,
	SUM(OL.Quantity) AS Total_Quantity_Sold
	FROM Sales.OrderLines AS OL
	JOIN Warehouse.StockItemStockGroups AS SSG ON SSG.StockItemID = OL.StockItemID
	JOIN Warehouse.StockGroups AS SG ON SG.StockGroupID = SSG.StockGroupID
	GROUP BY SG.StockGroupName
)
	
SELECT CTE1.Stock_Item_Groups, 
	Total_Quantity_Purchased, 
	Total_Quantity_Sold,
	(Total_Quantity_Purchased - ABS(Total_Quantity_Sold)) AS Remaining_Stock_Item
FROM CTE1 
JOIN CTE2 ON CTE1.Stock_Item_Groups = CTE2.Stock_Item_Groups;


