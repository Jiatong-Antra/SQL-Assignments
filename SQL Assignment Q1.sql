-- List of Persons’ full name, all their fax and phone numbers, 
-- as well as the phone number and fax of the company they are working for (if any).

USE WideWorldImporters;

SELECT FullName, 
	P.FaxNumber AS Personal_Fax,
	P.PhoneNumber AS Personal_Phone, 
	C.PhoneNumber AS Company_Phone,
	C.FaxNumber AS Company_Fax
FROM Application.People AS P
LEFT JOIN Sales.Customers AS C 
ON P.PersonID = C.PrimaryContactPersonID OR P.PersonID = C.AlternateContactPersonID



