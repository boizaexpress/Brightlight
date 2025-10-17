--List all orders along with the customer name and product name. 
--Expected Output Columns: 
--• OrderID, OrderDate, CustomerName, ProductName, Quantity 
SELECT
    O.OrderID,
    O.OrderDate,
    C.CustomerName,
    P.ProductName,
    O.Quantity
FROM
    Orders_large O
INNER JOIN
    Customers_large C ON O.CustomerID = C.CustomerID
INNER JOIN
    Products_large P ON O.ProductID = P.ProductID;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--Which customers have placed at least one order? 
--Expected Output Columns: 
--• CustomerID, CustomerName, Country, OrderID, OrderDate 
SELECT
    C.CustomerID,
    C.CustomerName,
    C.Country,
    O.OrderID,
    O.OrderDate
FROM
    Customers_large C
INNER JOIN
    Orders_large O ON C.CustomerID = O.CustomerID;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--List all customers and any orders they might have placed. Include customers who have not placed any orders. 
--Expected Output Columns: 
--• CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity 
SELECT
    C.CustomerID,
    C.CustomerName,
    C.Country,
    O.OrderID,
    O.OrderDate,
    O.ProductID,
    O.Quantity
FROM
    Customers_large C
LEFT JOIN
    Orders_large O ON C.CustomerID = O.CustomerID;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--List all products and how many times each was ordered (if any). 
--Expected Output Columns: 
--• ProductID, ProductName, TotalOrders 
--(TotalOrders is the count of how many times the product appears in orders)
SELECT
    P.ProductID,
    P.ProductName,
    COALESCE(T1.TotalOrders, 0) AS TotalOrders
FROM
    Products_large P
LEFT JOIN (
    SELECT
        ProductID,
        COUNT(OrderID) AS TotalOrders
    FROM
        Orders_large
    GROUP BY
        ProductID
) T1 ON P.ProductID = T1.ProductID
ORDER BY
    P.ProductID;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--Find all orders along with product details, including any products that might not have been ordered. 
--Expected Output Columns: 
--• OrderID, OrderDate, ProductID, ProductName, Price, Quantity 
SELECT
    O.OrderID,
    O.OrderDate,
    P.ProductID,
    P.ProductName,
    P.Price,
    O.Quantity
FROM
    Products_large P
LEFT JOIN
    Orders_large O ON P.ProductID = O.ProductID;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--Which customers have made orders, and include customers even if they have never 
--placed an order. 
--Expected Output Columns: 
--• CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity 
SELECT
    C.CustomerID,
    C.CustomerName,
    C.Country,
    O.OrderID,
    O.OrderDate,
    O.ProductID,
    O.Quantity
FROM
    Customers_large C
LEFT JOIN
    Orders_large O ON C.CustomerID = O.CustomerID;
----------------------------------------------------------------------------------------------------------------------------------------------------------------

--List all customers and orders, showing NULLs where customers have not ordered or where orders have no customer info. 
--Expected Output Columns: 
--• CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity 
SELECT
    COALESCE(C.CustomerID, O.CustomerID) AS CustomerID, 
    C.CustomerName,
    C.Country,
    O.OrderID,
    O.OrderDate,
    O.ProductID,
    O.Quantity
FROM
    Customers_large C
FULL OUTER JOIN
    Orders_large O ON C.CustomerID = O.CustomerID;
----------------------------------------------------------------------------------------------------------------------------------------------------------------

--List all products and orders, showing NULLs where products were never ordered or orders are missing product info. 
--Expected Output Columns: 
--• ProductID, ProductName, Price, OrderID, OrderDate, CustomerID, Quantity
SELECT
    COALESCE(P.ProductID, O.ProductID) AS ProductID,
    P.ProductName,
    P.Price,
    O.OrderID,
    O.OrderDate,
    O.CustomerID,
    O.Quantity
FROM
    Products_large P
FULL OUTER JOIN
    Orders_large O ON P.ProductID = O.ProductID;
