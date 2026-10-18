-- Populate table Staff
INSERT INTO Staff (StaffID, StaffName, Position, Salary, HireDate) VALUES (1, 'Dexter
Morgan', 'Manager', 5500.00, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO Staff (StaffID, StaffName, Position, Salary, HireDate) VALUES (2, 'Debra
Morgan', 'Barista', 3200.00, TO_DATE('2023-02-10', 'YYYY-MM-DD'));
INSERT INTO Staff (StaffID, StaffName, Position, Salary, HireDate) VALUES (3, 'James
Doakes', 'Barista', 3100.00, TO_DATE('2023-03-05', 'YYYY-MM-DD'));
INSERT INTO Staff (StaffID, StaffName, Position, Salary, HireDate) VALUES (4, 'Angel
Batista', 'Cashier', 3000.00, TO_DATE('2023-04-12', 'YYYY-MM-DD'));
INSERT INTO Staff (StaffID, StaffName, Position, Salary, HireDate) VALUES (5, 'Vince
Masuka', 'Barista', 3200.00, TO_DATE('2023-05-20', 'YYYY-MM-DD'));
INSERT INTO Staff (StaffID, StaffName, Position, Salary, HireDate) VALUES (6, 'Maria
LaGuerta', 'Cleaner', 2500.00, TO_DATE('2023-06-01', 'YYYY-MM-DD'));
INSERT INTO Staff (StaffID, StaffName, Position, Salary, HireDate) VALUES (7, 'Joey
Quinn', 'Barista', 3150.00, TO_DATE('2023-07-15', 'YYYY-MM-DD'));
INSERT INTO Staff (StaffID, StaffName, Position, Salary, HireDate) VALUES (8, 'Arthur
Mitchell', 'Shift Lead', 4000.00, TO_DATE('2023-08-22', 'YYYY-MM-DD'));
INSERT INTO Staff (StaffID, StaffName, Position, Salary, HireDate) VALUES (9, 'Hannah
McKay', 'Cashier', 3000.00, TO_DATE('2023-09-10', 'YYYY-MM-DD'));
INSERT INTO Staff (StaffID, StaffName, Position, Salary, HireDate) VALUES (10, 'Harry
Morgan', 'Barista', 3200.00, TO_DATE('2023-10-05', 'YYYY-MM-DD'));

-- Populate table Customer
INSERT INTO Customer (CustomerID, CustomerName, PhoneNumber, Email,
MembershipPoint) VALUES (1, 'Walter White', '012-9428100', 'walter@example.com', 150);
INSERT INTO Customer (CustomerID, CustomerName, PhoneNumber, Email,
MembershipPoint) VALUES (2, 'Jesse Pinkman', '013-5550102', 'jesse@example.com', 240);
INSERT INTO Customer (CustomerID, CustomerName, PhoneNumber, Email,
MembershipPoint) VALUES (3, 'Skyler White', '014-5550103', 'skyler@example.com', 50);
INSERT INTO Customer (CustomerID, CustomerName, PhoneNumber, Email,
MembershipPoint) VALUES (4, 'Hank Schrader', '016-5550104', 'hank@example.com', 310);
INSERT INTO Customer (CustomerID, CustomerName, PhoneNumber, Email,
MembershipPoint) VALUES (5, 'Saul Goodman', '017-5550105', 'saul@example.com', 500);
INSERT INTO Customer (CustomerID, CustomerName, PhoneNumber, Email,
MembershipPoint) VALUES (6, 'Gustavo Fring', '018-5550106', 'gus@example.com', 420);
INSERT INTO Customer (CustomerID, CustomerName, PhoneNumber, Email,
MembershipPoint) VALUES (7, 'Mike Ehrmantraut', '019-5550107', 'mike.e@example.com',
10);
INSERT INTO Customer (CustomerID, CustomerName, PhoneNumber, Email,
MembershipPoint) VALUES (8, 'Marie Schrader', '011-5550108', 'marie@example.com', 85);
INSERT INTO Customer (CustomerID, CustomerName, PhoneNumber, Email,
MembershipPoint) VALUES (9, 'Tuco Salamanca', '012-5550109', 'tuco@example.com',
999);
INSERT INTO Customer (CustomerID, CustomerName, PhoneNumber, Email,
MembershipPoint) VALUES (10, 'Gale Boetticher', '013-5550110', 'gale@example.com',
120);

-- Populate table Orders
INSERT INTO Orders (OrderID, OrderDate, TotalAmount, CustomerID, StaffID) VALUES
(101, TO_DATE('2024-05-01', 'YYYY-MM-DD'), 8.00, 1, 4);
INSERT INTO Orders (OrderID, OrderDate, TotalAmount, CustomerID, StaffID) VALUES
(102, TO_DATE('2024-05-01', 'YYYY-MM-DD'), 4.50, 2, 2);
INSERT INTO Orders (OrderID, OrderDate, TotalAmount, CustomerID, StaffID) VALUES
(103, TO_DATE('2024-05-01', 'YYYY-MM-DD'), 12.75, 5, 4);
INSERT INTO Orders (OrderID, OrderDate, TotalAmount, CustomerID, StaffID) VALUES
(104, TO_DATE('2024-05-02', 'YYYY-MM-DD'), 3.50, 3, 9);
INSERT INTO Orders (OrderID, OrderDate, TotalAmount, CustomerID, StaffID) VALUES
(105, TO_DATE('2024-05-02', 'YYYY-MM-DD'), 15.50, 6, 2);
INSERT INTO Orders (OrderID, OrderDate, TotalAmount, CustomerID, StaffID) VALUES
(106, TO_DATE('2024-05-03', 'YYYY-MM-DD'), 5.50, 7, 3);
INSERT INTO Orders (OrderID, OrderDate, TotalAmount, CustomerID, StaffID) VALUES
(107, TO_DATE('2024-05-03', 'YYYY-MM-DD'), 9.00, 4, 3);
INSERT INTO Orders (OrderID, OrderDate, TotalAmount, CustomerID, StaffID) VALUES
(108, TO_DATE('2024-05-04', 'YYYY-MM-DD'), 3.00, 8, 4);
INSERT INTO Orders (OrderID, OrderDate, TotalAmount, CustomerID, StaffID) VALUES
(109, TO_DATE('2024-05-04', 'YYYY-MM-DD'), 7.50, 9, 2);
INSERT INTO Orders (OrderID, OrderDate, TotalAmount, CustomerID, StaffID) VALUES
(110, TO_DATE('2024-05-04', 'YYYY-MM-DD'), 4.25, 10, 9);

-- Populate table Product
INSERT INTO Product (ProductID, ProductName, Category, Price, StockQuantity) VALUES
(1, 'Espresso', 'Drink', 3.50, 100);
INSERT INTO Product (ProductID, ProductName, Category, Price, StockQuantity) VALUES
(2, 'Latte', 'Drink', 4.50, 80);
INSERT INTO Product (ProductID, ProductName, Category, Price, StockQuantity) VALUES
(3, 'Cappuccino', 'Drink', 4.25, 80);
INSERT INTO Product (ProductID, ProductName, Category, Price, StockQuantity) VALUES
(4, 'Americano', 'Drink', 3.00, 150);
INSERT INTO Product (ProductID, ProductName, Category, Price, StockQuantity) VALUES
(5, 'Mocha', 'Drink', 5.00, 60);
INSERT INTO Product (ProductID, ProductName, Category, Price, StockQuantity) VALUES
(6, 'Croissant', 'Food', 2.50, 40);
INSERT INTO Product (ProductID, ProductName, Category, Price, StockQuantity) VALUES
(7, 'Blueberry Muffin', 'Food', 3.00, 30);
INSERT INTO Product (ProductID, ProductName, Category, Price, StockQuantity) VALUES
(8, 'Cheesecake', 'Food', 5.50, 20);
INSERT INTO Product (ProductID, ProductName, Category, Price, StockQuantity) VALUES
(9, 'Iced Tea', 'Drink', 3.25, 100);
INSERT INTO Product (ProductID, ProductName, Category, Price, StockQuantity) VALUES
(10, 'Hot Chocolate', 'Drink', 4.00, 50);

-- Populate table OrderDetail
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Subtotal) VALUES (101, 1, 1,
3.50);
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Subtotal) VALUES (101, 2, 1,
4.50);
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Subtotal) VALUES (102, 2, 1,
4.50);
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Subtotal) VALUES (103, 3, 3,
12.75);
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Subtotal) VALUES (104, 1, 1,
3.50);
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Subtotal) VALUES (105, 8, 2,
11.00);
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Subtotal) VALUES (105, 2, 1,
4.50);
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Subtotal) VALUES (106, 8, 1,
5.50);
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Subtotal) VALUES (107, 10, 1,
4.00);
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Subtotal) VALUES (107, 5, 1,
5.00);
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Subtotal) VALUES (108, 4, 1,
3.00);
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Subtotal) VALUES (109, 6, 3,
7.50);
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Subtotal) VALUES (110, 3, 1,
4.25);
