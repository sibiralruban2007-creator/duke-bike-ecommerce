SELECT * FROM Customer;

SELECT * FROM Customer
WHERE Customer_ID = 1;

SELECT * FROM Customer
WHERE Customer_Name = 'Renu Srinivasan';

SELECT Customer_ID, Customer_Name, Email, Phone_Number, Address
FROM Customer
ORDER BY Customer_Name;

SELECT COUNT(*) AS Total_Customers
FROM Customer;

UPDATE Customer
SET Phone_Number = '9123456789'
WHERE Customer_ID = 1;

SELECT * FROM Customer
WHERE Customer_ID = 1;

UPDATE Customer
SET Address = 'Anna Nagar, Chennai'
WHERE Customer_ID = 2;

SELECT * FROM Customer
WHERE Customer_ID = 2;

DELETE FROM Customer
WHERE Customer_ID = 10;

SELECT * FROM Customer;

COMMIT;
