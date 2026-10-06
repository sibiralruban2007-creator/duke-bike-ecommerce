SQL> CREATE TABLE Payment (
  2      Payment_ID NUMBER(5) PRIMARY KEY,
  3      Order_ID NUMBER(5),
  4      Customer_ID NUMBER(5),
  5      Payment_Date DATE NOT NULL,
  6      Payment_Method VARCHAR2(20) NOT NULL,
  7      Amount NUMBER(10,2) NOT NULL,
  8      Payment_Status VARCHAR2(20) NOT NULL
  9  );

Table created.

SQL> INSERT INTO Payment VALUES
  2  (301, 201, 1, DATE '2026-10-01', 'UPI', 205000, 'Paid');

1 row created.

SQL> INSERT INTO Payment VALUES
  2  (302, 202, 2, DATE '2026-10-01', 'Card', 250000, 'Paid');

1 row created.

SQL> INSERT INTO Payment VALUES
  2  (303, 203, 3, DATE '2026-10-02', 'Cash', 9000, 'Pending');

1 row created.

SQL> INSERT INTO Payment VALUES
  2  (304, 204, 4, DATE '2026-10-02', 'UPI', 2500, 'Paid');

1 row created.

SQL> INSERT INTO Payment VALUES
  2  (305, 205, 5, DATE '2026-10-03', 'Card', 350000, 'Paid');

1 row created.

SQL> INSERT INTO Payment VALUES
  2  (306, 206, 6, DATE '2026-10-03', 'UPI', 3500, 'Paid');

1 row created.

SQL> INSERT INTO Payment VALUES
  2  (307, 207, 7, DATE '2026-10-04', 'Cash', 8000, 'Pending');

1 row created.

SQL> INSERT INTO Payment VALUES
  2  (308, 208, 8, DATE '2026-10-04', 'Card', 7500, 'Paid');

1 row created.

SQL> INSERT INTO Payment VALUES
  2  (309, 209, 9, DATE '2026-10-05', 'UPI', 6500, 'Paid');

1 row created.

SQL> INSERT INTO Payment VALUES
  2  (310, 210, 10, DATE '2026-10-05', 'Cash', 5500, 'Failed');

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM Payment;

PAYMENT_ID  ORDER_ID  CUSTOMER_ID  PAYMENT_DATE  PAYMENT_METHOD  AMOUNT   PAYMENT_STATUS
----------  --------  -----------  ------------  --------------  -------  --------------
301         201       1            01-OCT-26     UPI             205000   Paid
302         202       2            01-OCT-26     Card            250000   Paid
303         203       3            02-OCT-26     Cash              9000   Pending
304         204       4            02-OCT-26     UPI               2500   Paid
305         205       5            03-OCT-26     Card            350000   Paid
306         206       6            03-OCT-26     UPI               3500   Paid
307         207       7            04-OCT-26     Cash              8000   Pending
308         208       8            04-OCT-26     Card              7500   Paid
309         209       9            05-OCT-26     UPI               6500   Paid
310         210       10           05-OCT-26     Cash              5500   Failed

10 rows selected.

SQL> SELECT * FROM Payment
  2  WHERE Payment_Status = 'Paid';

PAYMENT_ID  ORDER_ID  CUSTOMER_ID  PAYMENT_METHOD  AMOUNT
----------  --------  -----------  --------------  -------
301         201       1            UPI             205000
302         202       2            Card            250000
304         204       4            UPI               2500
305         205       5            Card            350000
306         206       6            UPI               3500
308         208       8            Card              7500
309         209       9            UPI               6500

7 rows selected.

SQL> SELECT * FROM Payment
  2  WHERE Payment_Status = 'Failed';

PAYMENT_ID  ORDER_ID  CUSTOMER_ID  PAYMENT_METHOD  AMOUNT
----------  --------  -----------  --------------  -------
310         210       10           Cash              5500

1 row selected.

SQL> SELECT Payment_Method, COUNT(*) AS TOTAL_TRANSACTIONS
  2  FROM Payment
  3  GROUP BY Payment_Method;

PAYMENT_METHOD  TOTAL_TRANSACTIONS
--------------  ------------------
UPI                         4
Card                        3
Cash                        3

3 rows selected.

SQL> SELECT Payment_Status, COUNT(*) AS TOTAL
  2  FROM Payment
  3  GROUP BY Payment_Status;

PAYMENT_STATUS       TOTAL
------------------  -----
Paid                    7
Pending                 2
Failed                  1

3 rows selected.

SQL> SELECT SUM(Amount) AS TOTAL_PAYMENT
  2  FROM Payment
  3  WHERE Payment_Status = 'Paid';

TOTAL_PAYMENT
-------------
817000
