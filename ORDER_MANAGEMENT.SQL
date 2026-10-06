SQL> CREATE TABLE Orders (
  2      Order_ID NUMBER(5) PRIMARY KEY,
  3      Customer_ID NUMBER(5),
  4      Product_ID NUMBER(5),
  5      Order_Date DATE,
  6      Quantity NUMBER(5),
  7      Total_Amount NUMBER(10,2),
  8      Order_Status VARCHAR2(20)
  9  );

Table created.

SQL> INSERT INTO Orders VALUES
  2  (201, 1, 101, DATE '2026-10-01', 1, 205000, 'Confirmed');

1 row created.

SQL> INSERT INTO Orders VALUES
  2  (202, 2, 102, DATE '2026-10-01', 1, 250000, 'Delivered');

1 row created.

SQL> INSERT INTO Orders VALUES
  2  (203, 3, 104, DATE '2026-10-02', 2, 9000, 'Pending');

1 row created.

SQL> INSERT INTO Orders VALUES
  2  (204, 4, 105, DATE '2026-10-02', 1, 2500, 'Confirmed');

1 row created.

SQL> INSERT INTO Orders VALUES
  2  (205, 5, 103, DATE '2026-10-03', 1, 350000, 'Delivered');

1 row created.

SQL> INSERT INTO Orders VALUES
  2  (206, 6, 107, DATE '2026-10-03', 1, 3500, 'Confirmed');

1 row created.

SQL> INSERT INTO Orders VALUES
  2  (207, 7, 108, DATE '2026-10-04', 2, 8000, 'Pending');

1 row created.

SQL> INSERT INTO Orders VALUES
  2  (208, 8, 109, DATE '2026-10-04', 1, 7500, 'Shipped');

1 row created.

SQL> INSERT INTO Orders VALUES
  2  (209, 9, 110, DATE '2026-10-05', 1, 6500, 'Delivered');

1 row created.

SQL> INSERT INTO Orders VALUES
  2  (210, 10, 106, DATE '2026-10-05', 1, 5500, 'Pending');

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM Orders;

ORDER_ID  CUSTOMER_ID  PRODUCT_ID  ORDER_DATE  QUANTITY  TOTAL_AMOUNT  ORDER_STATUS
--------  -----------  ----------  ----------  --------  ------------  ------------
201       1            101         01-OCT-26   1         205000        Confirmed
202       2            102         01-OCT-26   1         250000        Delivered
203       3            104         02-OCT-26   2           9000        Pending
204       4            105         02-OCT-26   1           2500        Confirmed
205       5            103         03-OCT-26   1         350000        Delivered
206       6            107         03-OCT-26   1           3500        Confirmed
207       7            108         04-OCT-26   2           8000        Pending
208       8            109         04-OCT-26   1           7500        Shipped
209       9            110         05-OCT-26   1           6500        Delivered
210       10           106         05-OCT-26   1           5500        Pending

10 rows selected.

SQL> SELECT * FROM Orders
  2  WHERE Order_Status = 'Confirmed';

ORDER_ID  CUSTOMER_ID  PRODUCT_ID  ORDER_STATUS
--------  -----------  ----------  ------------
201       1            101         Confirmed
204       4            105         Confirmed
206       6            107         Confirmed

3 rows selected.

SQL> SELECT * FROM Orders
  2  WHERE Order_Status = 'Pending';

ORDER_ID  CUSTOMER_ID  PRODUCT_ID  ORDER_STATUS
--------  -----------  ----------  ------------
203       3            104         Pending
207       7            108         Pending
210       10           106         Pending

3 rows selected.

SQL> SELECT COUNT(*) AS TOTAL_ORDERS
  2  FROM Orders;

TOTAL_ORDERS
------------
10

SQL> SELECT SUM(Total_Amount) AS TOTAL_SALES
  2  FROM Orders;

TOTAL_SALES
-----------
841500

SQL> SELECT Order_Status, COUNT(*) AS TOTAL
  2  FROM Orders
  3  GROUP BY Order_Status;

ORDER_STATUS       TOTAL
-----------------  -----
Confirmed             3
Delivered             3
Pending               3
Shipped               1

4 rows selected.
