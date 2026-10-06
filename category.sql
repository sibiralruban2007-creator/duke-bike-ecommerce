CREATE TABLE Category (
    Category_ID NUMBER(5) PRIMARY KEY,
    Category_Name VARCHAR2(50) NOT NULL
);

INSERT INTO Category VALUES (1, 'Duke Bikes');
INSERT INTO Category VALUES (2, 'Spare Parts');
INSERT INTO Category VALUES (3, 'Accessories');
INSERT INTO Category VALUES (4, 'Riding Gear');
INSERT INTO Category VALUES (5, 'Helmets');
INSERT INTO Category VALUES (6, 'Bike Lights');
INSERT INTO Category VALUES (7, 'Engine Parts');
INSERT INTO Category VALUES (8, 'Brake Parts');
INSERT INTO Category VALUES (9, 'Electrical Parts');
INSERT INTO Category VALUES (10, 'Bike Services');

COMMIT;

SELECT * FROM Category;

CATEGORY_ID  CATEGORY_NAME
-----------  ----------------
1            Duke Bikes
2            Spare Parts
3            Accessories
4            Riding Gear
5            Helmets
6            Bike Lights
7            Engine Parts
8            Brake Parts
9            Electrical Parts
10           Bike Services
