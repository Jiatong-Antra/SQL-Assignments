-- List all the cities that were updated after 2015-01-01

USE WideWorldImporters;

SELECT C.CityName
FROM Application.Cities AS C
WHERE C.ValidFrom > '2015-01-01';
