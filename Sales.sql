USE SalesAnalysis;

SELECT * FROM sales;

SELECT
COLUMN_NAME,
DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='sales';


SELECT COUNT(*) AS TotalRows
FROM sales;


SELECT
Row_ID,
COUNT(*) AS DuplicateCount
FROM sales
GROUP BY Row_ID
HAVING COUNT(*) > 1;


SELECT
COUNT(CASE WHEN Order_ID IS NULL THEN 1 END) AS OrderID_NULL,
COUNT(CASE WHEN Customer_ID IS NULL THEN 1 END) AS CustomerID_NULL,
COUNT(CASE WHEN Customer_Name IS NULL THEN 1 END) AS CustomerName_NULL,
COUNT(CASE WHEN Postal_Code IS NULL THEN 1 END) AS PostalCode_NULL,
COUNT(CASE WHEN Product_Name IS NULL THEN 1 END) AS ProductName_NULL,
COUNT(CASE WHEN Sales IS NULL THEN 1 END) AS Sales_NULL
FROM sales;


SELECT
    Row_ID,
    COUNT(*) AS DuplicateCount
FROM sales
GROUP BY Row_ID
HAVING COUNT(*) > 1;


SELECT *
FROM sales
WHERE Sales < 0;




--1: What is the total sales
SELECT
SUM(Sales) AS TotalSales
FROM sales ;

--2: How many unique orders are there
SELECT
    COUNT(DISTINCT Order_ID) AS TotalOrders
FROM sales;


--3: How many unique customers are there
SELECT
    COUNT(DISTINCT Customer_ID) AS TotalCustomers
FROM sales ;


--4: What is the average sales per record
SELECT
    AVG(Sales) AS AverageSales
FROM sales;

--5: What is the highest sales value
SELECT
    MAX(Sales) AS HighestSale
FROM sales ;

--6: What is the lowest sales value
SELECT
    MIN(Sales) AS LowestSale
FROM sales;


--7: What are the total sales by category
SELECT
    Category,
    SUM(Sales) AS TotalSales
FROM sales 
GROUP BY Category
ORDER BY TotalSales DESC;

--📌 Insight
--Technology generated the highest total sales, followed by Furniture, while Office Supplies recorded the lowest total sales among the three categories.

--8: What are the total sales by sub-category
SELECT
    Sub_Category,
    SUM(Sales) AS TotalSales
FROM sales 
GROUP BY Sub_Category
ORDER BY TotalSales DESC;
--📌 Insight

--Phones generated the highest total sales among all sub-categories, followed closely by Chairs.
--On the other hand, Fasteners recorded the lowest sales, indicating relatively low customer demand.

--9: What are the total sales by region
SELECT
    Region,
  round(SUM(Sales),2) AS TotalSales
FROM sales
GROUP BY Region
ORDER BY TotalSales DESC;


--9: Which category has the highest average sales
SELECT Category,
round(AVG(Sales),2) AS AvgSales
FROM sales
GROUP BY Category
ORDER BY AvgSales DESC;

--10: Which sub-category has the highest average sales
SELECT Sub_Category,
round(AVG(Sales),2) AS AvgSales
FROM sales
GROUP BY Sub_Category
ORDER BY AvgSales DESC;

--11: What are the total sales by region
SELECT Region,
round(SUM(Sales),2) AS TotalSales
FROM sales 
GROUP BY Region
ORDER BY TotalSales DESC;

--12: What are the total sales by state
SELECT State,
round(SUM(Sales),2) AS TotalSales
FROM sales
GROUP BY State
ORDER BY TotalSales DESC;

--13: What are the total sales by city
SELECT City,
round(SUM(Sales),2) AS TotalSales
FROM sales 
GROUP BY City
ORDER BY TotalSales DESC;

--14: Which region has the highest number of orders
SELECT Region,
COUNT(DISTINCT Order_ID) AS TotalOrders
FROM sales
GROUP BY Region
ORDER BY TotalOrders DESC;

--15: Who are the top 10 customers by sales
SELECT TOP 10
Customer_Name,
round(SUM(Sales),2) AS TotalSales
FROM sales
GROUP BY Customer_Name
ORDER BY TotalSales DESC;

--16: Who placed the highest number of orders
SELECT TOP 10
Customer_Name,
COUNT(DISTINCT Order_ID) AS OrdersCount
FROM sales 
GROUP BY Customer_Name
ORDER BY OrdersCount DESC;

--17: Which customer has the highest average purchase value
SELECT TOP 10
Customer_Name,
round(AVG(Sales),2) AS AvgSales
FROM sales 
GROUP BY Customer_Name
ORDER BY AvgSales DESC;

--18: What are the top 10 best-selling products
SELECT TOP 10
Product_Name,
round(SUM(Sales),2) AS TotalSales
FROM sales
GROUP BY Product_Name
ORDER BY TotalSales DESC;

--19: Which products have the lowest sales
SELECT TOP 10
Product_Name,
round(SUM(Sales),2) AS TotalSales
FROM sales
GROUP BY Product_Name
ORDER BY TotalSales ASC;

--20: Which products were sold the most times
SELECT TOP 10
Product_Name,
COUNT(*) AS TimesSold
FROM sales 
GROUP BY Product_Name
ORDER BY TimesSold DESC;

--21: Which shipping mode is used the most
SELECT Ship_Mode,
COUNT(*) AS TotalOrders
FROM sales 
GROUP BY Ship_Mode
ORDER BY TotalOrders DESC;

--22: What are the total sales by shipping mode
SELECT Ship_Mode,
round(SUM(Sales),2) AS TotalSales
FROM sales 
GROUP BY Ship_Mode
ORDER BY TotalSales DESC;

--23: What are the total sales by year
SELECT YEAR(Order_Date) AS OrderYear,
round(SUM(Sales),2) AS TotalSales
FROM sales
GROUP BY YEAR(Order_Date)
ORDER BY OrderYear;

--24: What are the total sales by month
SELECT MONTH(Order_Date) AS OrderMonth,
round(SUM(Sales),2) AS TotalSales
FROM sales
GROUP BY MONTH(Order_Date)
ORDER BY OrderMonth;

--25: Which month recorded the highest sales
SELECT TOP 1
MONTH(Order_Date) AS OrderMonth,
round(SUM(Sales),2) AS TotalSales
FROM sales
GROUP BY MONTH(Order_Date)
ORDER BY TotalSales DESC;