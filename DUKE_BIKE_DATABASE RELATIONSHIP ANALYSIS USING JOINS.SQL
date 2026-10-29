-- ============================================
-- DUKE BIKE DATABASE
-- DATABASE RELATIONSHIP ANALYSIS USING JOINS
-- CUSTOMER, PRODUCT, ORDERS AND PAYMENT TABLES
-- ============================================


-- 1. INNER JOIN
-- Display customers and their orders

SELECT
    C.ID,
    C.NAME,
    O.ORDER_ID,
    O.ORDER_DATE,
    O.TOTAL_AMOUNT
FROM Customer C
INNER JOIN Orders O
ON C.ID = O.CUSTOMER_ID;


-- 2. LEFT JOIN
-- Display all customers and their orders

SELECT
    C.ID,
    C.NAME,
    O.ORDER_ID,
    O.ORDER_DATE,
    O.TOTAL_AMOUNT
FROM Customer C
LEFT JOIN Orders O
ON C.ID = O.CUSTOMER_ID;


-- 3. RIGHT JOIN
-- Display all orders and customer details

SELECT
    C.ID,
    C.NAME,
    O.ORDER_ID,
    O.ORDER_DATE,
    O.TOTAL_AMOUNT
FROM Customer C
RIGHT JOIN Orders O
ON C.ID = O.CUSTOMER_ID;


-- 4. COMPLETE ORDER DETAILS
-- Display customer and order information

SELECT
    C.ID,
    C.NAME,
    O.ORDER_ID,
    O.ORDER_DATE,
    O.TOTAL_AMOUNT
FROM Customer C
INNER JOIN Orders O
ON C.ID = O.CUSTOMER_ID
ORDER BY O.ORDER_ID;


-- 5. CUSTOMER PURCHASE HISTORY
-- Display all customers and their purchase history

SELECT
    C.ID,
    C.NAME,
    O.ORDER_ID,
    O.ORDER_DATE,
    O.TOTAL_AMOUNT
FROM Customer C
LEFT JOIN Orders O
ON C.ID = O.CUSTOMER_ID
ORDER BY C.ID;


-- 6. PRODUCT ORDER DETAILS
-- Combine Orders and Product information

SELECT
    O.ORDER_ID,
    O.ORDER_DATE,
    P.PRODUCT_ID,
    P.PRODUCT_NAME
FROM Orders O
INNER JOIN Order_Details OD
ON O.ORDER_ID = OD.ORDER_ID
INNER JOIN Product P
ON OD.PRODUCT_ID = P.PRODUCT_ID;


-- 7. CUSTOMER PURCHASE HISTORY WITH PAYMENT
-- Display customer orders and payment information

SELECT
    C.ID,
    C.NAME,
    O.ORDER_ID,
    O.ORDER_DATE,
    O.TOTAL_AMOUNT,
    P.PAYMENT_ID,
    P.PAYMENT_DATE,
    P.PAYMENT_METHOD,
    P.PAYMENT_STATUS
FROM Customer C
INNER JOIN Orders O
ON C.ID = O.CUSTOMER_ID
INNER JOIN Payment P
ON O.ORDER_ID = P.ORDER_ID
ORDER BY C.ID;


-- 8. MULTI-TABLE BUSINESS REPORT
-- Combine Customer, Orders, Product and Payment

SELECT
    C.ID,
    C.NAME,
    O.ORDER_ID,
    O.ORDER_DATE,
    O.TOTAL_AMOUNT,
    PR.PRODUCT_ID,
    PR.PRODUCT_NAME,
    PY.PAYMENT_ID,
    PY.PAYMENT_STATUS
FROM Customer C
INNER JOIN Orders O
ON C.ID = O.CUSTOMER_ID
INNER JOIN Order_Details OD
ON O.ORDER_ID = OD.ORDER_ID
INNER JOIN Product PR
ON OD.PRODUCT_ID = PR.PRODUCT_ID
INNER JOIN Payment PY
ON O.ORDER_ID = PY.ORDER_ID;


-- 9. PAYMENT TRANSACTION REPORT
-- Display order and payment details

SELECT
    O.ORDER_ID,
    O.ORDER_DATE,
    O.TOTAL_AMOUNT,
    P.PAYMENT_ID,
    P.PAYMENT_DATE,
    P.PAYMENT_METHOD,
    P.PAYMENT_STATUS
FROM Orders O
INNER JOIN Payment P
ON O.ORDER_ID = P.ORDER_ID
ORDER BY O.ORDER_ID;


-- ============================================
-- END OF DUKE BIKE SQL QUERIES
-- ============================================
