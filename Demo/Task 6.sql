--  Identify Low Stock Products
SELECT ProductID, ProductName, StockQuantity
FROM Product
WHERE StockQuantity <= 50;

-- Give 10% Raise to Three Staffs With Most Processed Orders
UPDATE Staff
SET Salary = Salary * 1.10
WHERE StaffID IN (
 SELECT StaffID
 FROM (
 SELECT StaffID
 FROM Orders
 GROUP BY StaffID
 ORDER BY COUNT(OrderID) DESC )
 WHERE ROWNUM <= 3);
 
 -- Display Top Three Products Ranked by Highest Revenue With Units Sold
SELECT * FROM (
SELECT p.ProductName AS "Product Name",
SUM(d.Quantity) AS "Units Sold",
SUM(d.Subtotal) AS "Revenue"
FROM Product p
JOIN OrderDetail d ON p.ProductID = d.ProductID
GROUP BY p.ProductName
ORDER BY "Revenue" DESC)
WHERE ROWNUM <= 3;

-- Award 10 Bonus Membership Points to Three Top Spending Customers
UPDATE Customer
SET MembershipPoint = MembershipPoint + 10
WHERE CustomerID IN (
SELECT CustomerID FROM (
SELECT CustomerID
FROM Orders
GROUP BY CustomerID
ORDER BY SUM(TotalAmount) DESC)
WHERE ROWNUM <= 3) ;

-- Compare Total Units Sold Between Food and Drink Categories
SELECT p.Category, SUM(d.Quantity) AS "Units Sold"
FROM Product p
JOIN OrderDetail d ON p.ProductID = d.ProductID
GROUP BY p.Category
ORDER BY SUM(d.Quantity) DESC;
