CREATE TABLE Customer_CRUD (
    Customer_ID NUMBER PRIMARY KEY,
    Customer_Name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) UNIQUE NOT NULL,
    Phone_Number VARCHAR2(15),
    Address VARCHAR2(255)
);

INSERT INTO Customer_CRUD
VALUES (1, 'Renu Srinivasan', 'renu@gmail.com', '9876543210', 'Chennai');

INSERT INTO Customer_CRUD
VALUES (2, 'Arjun Kumar', 'arjun.kumar@gmail.com', '9876501234', 'Coimbatore');

INSERT INTO Customer_CRUD
VALUES (3, 'Priya Kumar', 'priya.kumar@gmail.com', '9876512345', 'Madurai');

INSERT INTO Customer_CRUD
VALUES (4, 'Rahul Sharma', 'rahul.sharma@gmail.com', '9876523456', 'Salem');

INSERT INTO Customer_CRUD
VALUES (5, 'Keerthana Mohan', 'keerthana.mohan@gmail.com', '9876534567', 'Trichy');

SELECT * FROM Customer_CRUD;

UPDATE Customer_CRUD
SET Phone_Number = '9123456789'
WHERE Customer_ID = 1;

SELECT * FROM Customer_CRUD
WHERE Customer_ID = 1;

UPDATE Customer_CRUD
SET Address = 'Anna Nagar, Chennai'
WHERE Customer_ID = 2;

SELECT * FROM Customer_CRUD
WHERE Customer_ID = 2;

DELETE FROM Customer_CRUD
WHERE Customer_ID = 5;

SELECT * FROM Customer_CRUD;

COMMIT;
