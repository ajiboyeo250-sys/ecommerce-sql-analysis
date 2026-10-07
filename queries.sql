-- Project 3: SQL Data Analysis Report
-- Author: Ajiboye Opeyemi Oluwasijibomi
-- Database: sql_project | Table: ecom_orders

-- Query 1: High-Value Delivered Orders
SELECT OrderID, Date, CustomerID, Product, Quantity, UnitPrice, TotalPrice, OrderStatus
FROM ecom_orders
WHERE OrderStatus = 'Delivered' AND TotalPrice > 1000
ORDER BY TotalPrice DESC;

-- Query 2: Product Revenue Performance
SELECT 
    Product,
    COUNT(OrderID) AS Total_Orders,
    SUM(Quantity) AS Total_Units_Sold,
    ROUND(AVG(UnitPrice), 2) AS Avg_Unit_Price,
    ROUND(SUM(TotalPrice), 2) AS Total_Revenue
FROM ecom_orders
GROUP BY Product
ORDER BY Total_Revenue DESC;

-- Query 3: Order Status Breakdown (2024 Onwards)
SELECT 
    OrderStatus,
    COUNT(OrderID) AS Order_Count,
    ROUND(SUM(TotalPrice), 2) AS Gross_Value,
    ROUND(AVG(TotalPrice), 2) AS Avg_Order_Value
FROM ecom_orders
WHERE Date >= '2024-01-01'
GROUP BY OrderStatus
ORDER BY Order_Count DESC;

-- Query 4: Marketing Referral Channels
SELECT 
    ReferralSource,
    COUNT(OrderID) AS Fulfilled_Orders,
    SUM(Quantity) AS Total_Units,
    ROUND(SUM(TotalPrice), 2) AS Net_Revenue
FROM ecom_orders
WHERE OrderStatus IN ('Shipped', 'Delivered')
GROUP BY ReferralSource
ORDER BY Net_Revenue DESC;
