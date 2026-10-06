SQL> CREATE TABLE Seller (
  2      Seller_ID NUMBER(5) PRIMARY KEY,
  3      Seller_Name VARCHAR2(50) NOT NULL,
  4      Email VARCHAR2(100) UNIQUE NOT NULL,
  5      Phone_Number VARCHAR2(15)
  6  );

Table created.

SQL> INSERT INTO Seller VALUES
  2  (1, 'Duke Motors', 'dukemotors@gmail.com', '9876500001');

1 row created.

SQL> INSERT INTO Seller VALUES
  2  (2, 'KTM Spares', 'ktmspares@gmail.com', '9876500002');

1 row created.

SQL> INSERT INTO Seller VALUES
  2  (3, 'Bike Accessories', 'bikeacc@gmail.com', '9876500003');

1 row created.

SQL> INSERT INTO Seller VALUES
  2  (4, 'Chennai Bike Hub', 'chennaibike@gmail.com', '9876500004');

1 row created.

SQL> INSERT INTO Seller VALUES
  2  (5, 'Madurai Motors', 'maduraimotors@gmail.com', '9876500005');

1 row created.

SQL> INSERT INTO Seller VALUES
  2  (6, 'Salem Bike Store', 'salembike@gmail.com', '9876500006');

1 row created.

SQL> INSERT INTO Seller VALUES
  2  (7, 'Coimbatore KTM', 'coimbatorektm@gmail.com', '9876500007');

1 row created.

SQL> INSERT INTO Seller VALUES
  2  (8, 'Trichy Auto Hub', 'trichyauto@gmail.com', '9876500008');

1 row created.

SQL> INSERT INTO Seller VALUES
  2  (9, 'Vellore Bike World', 'vellorebike@gmail.com', '9876500009');

1 row created.

SQL> INSERT INTO Seller VALUES
  2  (10, 'Erode Motors', 'erodemotors@gmail.com', '9876500010');

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM Seller;

SELLER_ID  SELLER_NAME          EMAIL                         PHONE_NUMBER
---------  -------------------  ----------------------------  ------------
1          Duke Motors          dukemotors@gmail.com          9876500001
2          KTM Spares           ktmspares@gmail.com           9876500002
3          Bike Accessories     bikeacc@gmail.com             9876500003
4          Chennai Bike Hub     chennaibike@gmail.com         9876500004
5          Madurai Motors       maduraimotors@gmail.com       9876500005
6          Salem Bike Store     salembike@gmail.com           9876500006
7          Coimbatore KTM       coimbatorektm@gmail.com       9876500007
8          Trichy Auto Hub      trichyauto@gmail.com          9876500008
9          Vellore Bike World   vellorebike@gmail.com         9876500009
10         Erode Motors         erodemotors@gmail.com         9876500010

10 rows selected.


SQL> CREATE TABLE Inventory (
  2      Inventory_ID NUMBER(5) PRIMARY KEY,
  3      Product_ID NUMBER(5),
  4      Seller_ID NUMBER(5),
  5      Stock_Quantity NUMBER(5),
  6      Inventory_Status VARCHAR2(20)
  7  );

Table created.

SQL> INSERT INTO Inventory VALUES
  2  (401, 101, 1, 5, 'Available');

1 row created.

SQL> INSERT INTO Inventory VALUES
  2  (402, 102, 1, 4, 'Available');

1 row created.

SQL> INSERT INTO Inventory VALUES
  2  (403, 103, 1, 3, 'Available');

1 row created.

SQL> INSERT INTO Inventory VALUES
  2  (404, 104, 2, 10, 'Available');

1 row created.

SQL> INSERT INTO Inventory VALUES
  2  (405, 105, 2, 0, 'Unavailable');

1 row created.

SQL> INSERT INTO Inventory VALUES
  2  (406, 106, 2, 8, 'Available');

1 row created.

SQL> INSERT INTO Inventory VALUES
  2  (407, 107, 3, 12, 'Available');

1 row created.

SQL> INSERT INTO Inventory VALUES
  2  (408, 108, 3, 0, 'Unavailable');

1 row created.

SQL> INSERT INTO Inventory VALUES
  2  (409, 109, 3, 6, 'Available');

1 row created.

SQL> INSERT INTO Inventory VALUES
  2  (410, 110, 4, 10, 'Available');

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM Inventory;

INVENTORY_ID  PRODUCT_ID  SELLER_ID  STOCK_QUANTITY  INVENTORY_STATUS
------------  ----------  ---------  --------------  ----------------
401           101         1          5               Available
402           102         1          4               Available
403           103         1          3               Available
404           104         2          10              Available
405           105         2          0               Unavailable
406           106         2          8               Available
407           107         3          12              Available
408           108         3          0               Unavailable
409           109         3          6               Available
410           110         4          10              Available

10 rows selected.


SQL> SELECT * FROM Inventory
  2  WHERE Inventory_Status = 'Available';

INVENTORY_ID  PRODUCT_ID  SELLER_ID  STOCK_QUANTITY  INVENTORY_STATUS
------------  ----------  ---------  --------------  ----------------
401           101         1          5               Available
402           102         1          4               Available
403           103         1          3               Available
404           104         2          10              Available
406           106         2          8               Available
407           107         3          12              Available
409           109         3          6               Available
410           110         4          10              Available

8 rows selected.


SQL> SELECT * FROM Inventory
  2  WHERE Inventory_Status = 'Unavailable';

INVENTORY_ID  PRODUCT_ID  SELLER_ID  STOCK_QUANTITY  INVENTORY_STATUS
------------  ----------  ---------  --------------  ----------------
405           105         2          0               Unavailable
408           108         3          0               Unavailable

2 rows selected.


SQL> SELECT Inventory_Status, COUNT(*) AS TOTAL
  2  FROM Inventory
  3  GROUP BY Inventory_Status;

INVENTORY_STATUS  TOTAL
----------------  -----
Available         8
Unavailable       2
