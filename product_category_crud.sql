CREATE TABLE Category (
    Category_ID     NUMBER PRIMARY KEY,
    Category_Name   VARCHAR2(50) NOT NULL,
    Description     VARCHAR2(255)
);

INSERT INTO Category (Category_ID, Category_Name, Description)
VALUES (1, 'Duke Bikes', 'Duke motorcycles available for purchase');

INSERT INTO Category (Category_ID, Category_Name, Description)
VALUES (2, 'Spare Parts', 'Original spare parts for Duke motorcycles');

INSERT INTO Category (Category_ID, Category_Name, Description)
VALUES (3, 'Accessories', 'Accessories for Duke motorcycles');

INSERT INTO Category (Category_ID, Category_Name, Description)
VALUES (4, 'Riding Gear', 'Safety and riding equipment for riders');

INSERT INTO Category (Category_ID, Category_Name, Description)
VALUES (5, 'Bike Services', 'Maintenance and service for Duke motorcycles');


CREATE TABLE Product (
    Product_ID      NUMBER PRIMARY KEY,
    Product_Name    VARCHAR2(100) NOT NULL,
    Brand_ID        NUMBER,
    Category_ID     NUMBER NOT NULL,
    Price           NUMBER(10,2) NOT NULL,
    Model           VARCHAR2(50),
    Color           VARCHAR2(50),
    Stock           NUMBER NOT NULL,
    CONSTRAINT FK_Product_Category
        FOREIGN KEY (Category_ID)
        REFERENCES Category(Category_ID)
);


INSERT INTO Product
VALUES (101, 'KTM Duke 200', 1, 1, 198000.00, 'Duke 200', 'Orange', 10);

INSERT INTO Product
VALUES (102, 'KTM Duke 250', 1, 1, 230000.00, 'Duke 250', 'Black', 8);

INSERT INTO Product
VALUES (103, 'KTM Duke 390', 1, 1, 320000.00, 'Duke 390', 'Orange', 6);

INSERT INTO Product
VALUES (104, 'Duke Clutch Plate', 1, 2, 4500.00, 'Duke 200', 'Black', 25);

INSERT INTO Product
VALUES (105, 'Duke Brake Pad Set', 1, 2, 2800.00, 'Duke 250', 'Black', 30);

INSERT INTO Product
VALUES (106, 'Duke Chain Kit', 1, 2, 6500.00, 'Duke 390', 'Steel', 20);

INSERT INTO Product
VALUES (107, 'Duke Crash Guard', 1, 3, 5500.00, 'Duke 200', 'Black', 18);

INSERT INTO Product
VALUES (108, 'Duke LED Headlight', 1, 3, 7500.00, 'Duke 390', 'White', 12);

INSERT INTO Product
VALUES (109, 'Duke Riding Jacket', 1, 4, 8500.00, 'All Models', 'Black', 15);

INSERT INTO Product
VALUES (110, 'Duke General Service', 1, 5, 3500.00, 'All Models', 'N/A', 20);


SELECT * FROM Category;

SELECT * FROM Product;


UPDATE Product
SET Price = 195000.00,
    Stock = 12
WHERE Product_ID = 101;

SELECT * FROM Product
WHERE Product_ID = 101;


UPDATE Product
SET Price = 235000.00
WHERE Product_Name = 'KTM Duke 250';

SELECT * FROM Product
WHERE Product_Name = 'KTM Duke 250';


DELETE FROM Product
WHERE Product_ID = 110;

SELECT * FROM Product
WHERE Product_ID = 110;


DELETE FROM Product
WHERE Product_Name = 'Duke Riding Jacket';

SELECT * FROM Product
WHERE Product_Name = 'Duke Riding Jacket';


SELECT * FROM Product;


SELECT
    c.Category_Name,
    p.Product_ID,
    p.Product_Name,
    p.Price,
    p.Stock
FROM Category c
JOIN Product p
    ON c.Category_ID = p.Category_ID
ORDER BY c.Category_Name, p.Product_Name;


SELECT
    p.Product_ID,
    p.Product_Name,
    p.Price,
    p.Stock
FROM Product p
JOIN Category c
    ON p.Category_ID = c.Category_ID
WHERE c.Category_Name = 'Spare Parts';


SELECT
    c.Category_Name,
    COUNT(p.Product_ID) AS Total_Products
FROM Category c
LEFT JOIN Product p
    ON c.Category_ID = p.Category_ID
GROUP BY c.Category_Name
ORDER BY c.Category_Name;


COMMIT;
