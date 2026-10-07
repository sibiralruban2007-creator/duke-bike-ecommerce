SQL> CREATE TABLE Review (
  2      Review_ID NUMBER(5) PRIMARY KEY,
  3      Customer_ID NUMBER(5) NOT NULL,
  4      Product_ID NUMBER(5) NOT NULL,
  5      Rating NUMBER(1) NOT NULL,
  6      Review_Text VARCHAR2(200),
  7      Review_Date DATE
  8  );

Table created.


SQL> INSERT INTO Review VALUES
  2  (501, 1, 101, 5, 'Excellent bike performance', DATE '2026-10-01');

1 row created.

SQL> INSERT INTO Review VALUES
  2  (502, 2, 102, 5, 'Very good Duke bike', DATE '2026-10-01');

1 row created.

SQL> INSERT INTO Review VALUES
  2  (503, 3, 104, 4, 'Good quality clutch plate', DATE '2026-10-02');

1 row created.

SQL> INSERT INTO Review VALUES
  2  (504, 4, 105, 5, 'Excellent brake pads', DATE '2026-10-02');

1 row created.

SQL> INSERT INTO Review VALUES
  2  (505, 5, 103, 5, 'Amazing Duke 390', DATE '2026-10-03');

1 row created.

SQL> INSERT INTO Review VALUES
  2  (506, 6, 107, 4, 'Good crash guard', DATE '2026-10-03');

1 row created.

SQL> INSERT INTO Review VALUES
  2  (507, 7, 108, 4, 'Bright LED light', DATE '2026-10-04');

1 row created.

SQL> INSERT INTO Review VALUES
  2  (508, 8, 109, 5, 'Comfortable riding jacket', DATE '2026-10-04');

1 row created.

SQL> INSERT INTO Review VALUES
  2  (509, 9, 110, 4, 'Good helmet quality', DATE '2026-10-05');

1 row created.

SQL> INSERT INTO Review VALUES
  2  (510, 10, 106, 5, 'Strong chain kit', DATE '2026-10-05');

1 row created.


SQL> COMMIT;

Commit complete.


SQL> SELECT * FROM Review;

REVIEW_ID  CUSTOMER_ID  PRODUCT_ID  RATING  REVIEW_TEXT
---------  -----------  ----------  ------  ---------------------------
501        1            101         5       Excellent bike performance
502        2            102         5       Very good Duke bike
503        3            104         4       Good quality clutch plate
504        4            105         5       Excellent brake pads
505        5            103         5       Amazing Duke 390
506        6            107         4       Good crash guard
507        7            108         4       Bright LED light
508        8            109         5       Comfortable riding jacket
509        9            110         4       Good helmet quality
510        10           106         5       Strong chain kit

10 rows selected.


SQL> SELECT Product_ID, AVG(Rating) AS AVERAGE_RATING
  2  FROM Review
  3  GROUP BY Product_ID;

PRODUCT_ID  AVERAGE_RATING
----------  --------------
101         5
102         5
103         5
104         4
105         5
106         5
107         4
108         4
109         5
110         4


SQL> SELECT Product_ID, AVG(Rating) AS AVERAGE_RATING
  2  FROM Review
  3  GROUP BY Product_ID
  4  HAVING AVG(Rating) >= 5;

PRODUCT_ID  AVERAGE_RATING
----------  --------------
101         5
102         5
103         5
105         5
106         5


SQL> SELECT Rating, COUNT(*) AS TOTAL_REVIEWS
  2  FROM Review
  3  GROUP BY Rating
  4  ORDER BY Rating DESC;

RATING  TOTAL_REVIEWS
------  -------------
5       6
4       4
