-- Create table Staff
CREATE TABLE Staff (
 StaffID INT PRIMARY KEY,
 StaffName VARCHAR2(100) NOT NULL,
 Position VARCHAR2(50),
 Salary NUMBER(10,2) NOT NULL CHECK (Salary > 0),
 HireDate DATE NOT NULL );

--Create table Customers
CREATE TABLE Customer (
 CustomerID INT PRIMARY KEY,
 CustomerName VARCHAR2(100) NOT NULL,
 PhoneNumber VARCHAR2(20),
 Email VARCHAR2(100),
 MembershipPoint INT );
 
 -- Create table Orders
CREATE TABLE Orders (
 OrderID INT PRIMARY KEY,
 OrderDate DATE NOT NULL,
 TotalAmount NUMBER(10,2) NOT NULL CHECK (TotalAmount > 0),
 CustomerID INT NOT NULL,
 StaffID INT NOT NULL,
 FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
 FOREIGN KEY (StaffID) REFERENCES Staff(StaffID) );
 
 --Create table Product
CREATE TABLE Product (
 ProductID INT PRIMARY KEY,
 ProductName VARCHAR2(100) NOT NULL,
 Category VARCHAR2(20) NOT NULL,
 Price NUMBER(10,2) NOT NULL CHECK (Price > 0),
 StockQuantity INT NOT NULL CHECK (StockQuantity >= 0) );
 
 --Create table OrderDetails
CREATE TABLE OrderDetail (
 OrderID INT NOT NULL,
 ProductID INT NOT NULL,
 Subtotal NUMBER(10,2)NOT NULL CHECK (Subtotal > 0),
 Quantity INT NOT NULL CHECK (Quantity > 0),
 PRIMARY KEY (OrderID, ProductID),
 FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
 FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

