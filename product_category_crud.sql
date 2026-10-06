SQL> CREATE TABLE Category (
  2      Category_ID NUMBER(5) PRIMARY KEY,
  3      Category_Name VARCHAR2(50) NOT NULL
  4  );

Table created.

SQL> INSERT INTO Category VALUES (1, 'Duke Bikes');

1 row created.

SQL> INSERT INTO Category VALUES (2, 'Spare Parts');

1 row created.

SQL> INSERT INTO Category VALUES (3, 'Accessories');

1 row created.

SQL> INSERT INTO Category VALUES (4, 'Riding Gear');

1 row created.

SQL> INSERT INTO Category VALUES (5, 'Helmets');

1 row created.

SQL> INSERT INTO Category VALUES (6, 'Bike Lights');

1 row created.

SQL> INSERT INTO Category VALUES (7, 'Engine Parts');

1 row created.

SQL> INSERT INTO Category VALUES (8, 'Brake Parts');

1 row created.

SQL> INSERT INTO Category VALUES (9, 'Electrical Parts');

1 row created.

SQL> INSERT INTO Category VALUES (10, 'Bike Services');

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM Category;

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

10 rows selected.


SQL> CREATE TABLE Product (
  2      Product_ID NUMBER(5) PRIMARY KEY,
  3      Product_Name VARCHAR2(100) NOT NULL,
  4      Category_ID NUMBER(5),
  5      Price NUMBER(10,2),
  6      Stock_Quantity NUMBER(5)
  7  );

Table created.

SQL> INSERT INTO Product VALUES
  2  (101, 'KTM Duke 200', 1, 200000, 5);

1 row created.

SQL> INSERT INTO Product VALUES
  2  (102, 'KTM Duke 250', 1, 250000, 4);

1 row created.

SQL> INSERT INTO Product VALUES
  2  (103, 'KTM Duke 390', 1, 350000, 3);

1 row created.

SQL> INSERT INTO Product VALUES
  2  (104, 'Clutch Plate', 2, 4500, 10);

1 row created.

SQL> INSERT INTO Product VALUES
  2  (105, 'Brake Pads', 8, 2500, 15);

1 row created.

SQL> INSERT INTO Product VALUES
  2  (106, 'Chain Kit', 2, 5500, 8);

1 row created.

SQL> INSERT INTO Product VALUES
  2  (107, 'Crash Guard', 3, 3500, 12);

1 row created.

SQL> INSERT INTO Product VALUES
  2  (108, 'LED Headlight', 6, 4000, 7);

1 row created.

SQL> INSERT INTO Product VALUES
  2  (109, 'Riding Jacket', 4, 7500, 6);

1 row created.

SQL> INSERT INTO Product VALUES
  2  (110, 'Full Face Helmet', 5, 6500, 10);

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM Product;

PRODUCT_ID  PRODUCT_NAME        CATEGORY_ID  PRICE       STOCK_QUANTITY
----------  ------------------  -----------  ----------  --------------
101         KTM Duke 200        1            200000      5
102         KTM Duke 250        1            250000      4
103         KTM Duke 390        1            350000      3
104         Clutch Plate        2            4500        10
105         Brake Pads          8            2500        15
106         Chain Kit           2            5500        8
107         Crash Guard         3            3500        12
108         LED Headlight       6            4000        7
109         Riding Jacket       4            7500        6
110         Full Face Helmet    5            6500        10

10 rows selected.


SQL> UPDATE Product
  2  SET Price = 205000
  3  WHERE Product_ID = 101;

1 row updated.

SQL> SELECT Product_ID, Product_Name, Price
  2  FROM Product
  3  WHERE Product_ID = 101;

PRODUCT_ID  PRODUCT_NAME    PRICE
----------  --------------  ----------
101         KTM Duke 200    205000

1 row selected.


SQL> SELECT
  2      P.Product_ID,
  3      P.Product_Name,
  4      C.Category_Name,
  5      P.Price,
  6      P.Stock_Quantity
  7  FROM Product P
  8  JOIN Category C
  9  ON P.Category_ID = C.Category_ID;

PRODUCT_ID  PRODUCT_NAME        CATEGORY_NAME    PRICE       STOCK_QUANTITY
----------  ------------------  ---------------  ----------  --------------
101         KTM Duke 200        Duke Bikes       205000      5
102         KTM Duke 250        Duke Bikes       250000      4
103         KTM Duke 390        Duke Bikes       350000      3
104         Clutch Plate        Spare Parts      4500        10
105         Brake Pads          Brake Parts      2500        15
106         Chain Kit           Spare Parts      5500        8
107         Crash Guard         Accessories      3500        12
108         LED Headlight       Bike Lights      4000        7
109         Riding Jacket       Riding Gear      7500        6
110         Full Face Helmet    Helmets          6500        10

10 rows selected.
