-- List any orders that had more than one delivery attempt (located in invoice table)

USE WideWorldImporters;

SELECT I.OrderID
FROM Sales.Invoices AS I
WHERE JSON_VALUE(I.ReturnedDeliveryData, '$.Events[1].Status') IS NULL