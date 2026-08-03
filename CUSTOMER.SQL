-- CUSTOMER
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Gender VARCHAR(10),
    Date_of_Birth DATE,
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address TEXT,
    City VARCHAR(50),
    State VARCHAR(50),
    Pincode INT,
    Registration_Date DATE
);

-- CATEGORY
CREATE TABLE Category (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(50),
    Category_Description TEXT,
    Status VARCHAR(20)
);

-- SUPPLIER
CREATE TABLE Supplier (
    Supplier_ID INT PRIMARY KEY,
    Supplier_Name VARCHAR(100),
    Contact_Person VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    City VARCHAR(50),
    GST_Number VARCHAR(20)
);

-- PRODUCT
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category_ID INT,
    Supplier_ID INT,
    Price DECIMAL(10,2),
    Weight VARCHAR(20),
    Ingredients TEXT,
    Skin_Type VARCHAR(30),
    Brand VARCHAR(50),
    Expiry_Date DATE,
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID),
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID)
);

-- INVENTORY
CREATE TABLE Inventory (
    Inventory_ID INT PRIMARY KEY,
    Product_ID INT UNIQUE,
    Quantity INT,
    Minimum_Stock INT,
    Warehouse VARCHAR(100),
    Last_Updated DATE,
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

-- ORDERS
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    Total_Amount DECIMAL(10,2),
    Order_Status VARCHAR(30),
    Shipping_Address TEXT,
    Delivery_Date DATE,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- ORDER DETAILS
CREATE TABLE Order_Details (
    Order_Detail_ID INT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Discount DECIMAL(10,2),
    Total_Price DECIMAL(10,2),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

-- PAYMENT
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Order_ID INT UNIQUE,
    Payment_Method VARCHAR(30),
    Transaction_ID VARCHAR(100),
    Payment_Status VARCHAR(20),
    Payment_Date DATE,
    Amount DECIMAL(10,2),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

-- ADMIN
CREATE TABLE Admin (
    Admin_ID INT PRIMARY KEY,
    Admin_Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Role VARCHAR(30),
    Username VARCHAR(50),
    Password VARCHAR(100)
);