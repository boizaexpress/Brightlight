--Q1. Display all columns for all transactions. 
--Expected output: All columns 
SELECT *
FROM B_LEARNING.S_LIGHT.RETAIL_SALES_DATASET;
-------------------------------------------------------------------------------------------------------------------------------------------------------

--Q2. Display only the Transaction ID, Date, and Customer ID for all records. 
--Expected output: Transaction ID, Date, Customer ID 
SELECT transaction_id,
       Date,
       CUSTOMER_ID
FROM B_LEARNING.S_LIGHT.RETAIL_SALES_DATASET;
------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q3. Display all the distinct product categories in the dataset. 
--Expected output: Product Category
SELECT DISTINCT product_category
FROM B_LEARNING.S_LIGHT.RETAIL_SALES_DATASET;
------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q4. Display all the distinct gender values in the dataset. 
--Expected output: Gender 
SELECT DISTINCT gender
FROM B_LEARNING.S_LIGHT.RETAIL_SALES_DATASET;
-----------------------------------------------------------------------------------------------------------------------------------------------------------

--Q5. Display all transactions where the Age is greater than 40. 
--Expected output: All columns
SELECT *
FROM B_LEARNING.S_LIGHT.RETAIL_SALES_DATASET
WHERE age>40;
----------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q6. Display all transactions where the Price per Unit is between 100 and 500. 
--Expected output: All columns 
SELECT *
FROM B_LEARNING.S_LIGHT.RETAIL_SALES_DATASET
WHERE PRICE_PER_UNIT BETWEEN 100 AND 500;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q7. Display all transactions where the Product Category is either 'Beauty' or 'Electronics'. 
--Expected output: All columns
SELECT *
FROM B_LEARNING.S_LIGHT.RETAIL_SALES_DATASET
WHERE product_category = 'Beauty' OR product_category = 'Electronics';
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q8. Display all transactions where the Product Category is not 'Clothing'. 
--Expected output: All columns
SELECT *
FROM B_LEARNING.S_LIGHT.RETAIL_SALES_DATASET
WHERE product_category != 'Clothing';
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q9. Display all transactions where the Quantity is greater than or equal to 3. 
--Expected output: All columns 
SELECT *
FROM B_LEARNING.S_LIGHT.RETAIL_SALES_DATASET
WHERE quantity >=3
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q10. Count the total number of transactions. 
--Expected output: Total_Transactions
SELECT COUNT(transaction_id) AS total_transactions
FROM B_LEARNING.S_LIGHT.RETAIL_SALES_DATASET;
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q11. Find the average Age of customers. 
--Expected output: Average_Age
SELECT SUM(age) AS Average_Age
FROM B_LEARNING.S_LIGHT.RETAIL_SALES_DATASET;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q12. Find the total quantity of products sold. 
--Expected output: Total_Quantity 
SELECT SUM(quantity) AS total_quantity
FROM B_LEARNING.S_LIGHT.RETAIL_SALES_DATASET;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q13. Find the maximum Total Amount spent in a single transaction. 
--Expected output: Max_Total_Amount 
SELECT MAX(total_amount) AS Max_Total_Amount
FROM B_LEARNING.S_LIGHT.RETAIL_SALES_DATASET;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q14. Find the minimum Price per Unit in the dataset. 
--Expected output: Min_Price_per_Unit
SELECT MIN(price_per_unit) AS Min_Price_per_Unit
FROM B_LEARNING.S_LIGHT.RETAIL_SALES_DATASET;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q15. Find the number of transactions per Product Category. 
--Expected output: Product Category, Transaction_Count 
SELECT product_category,
       COUNT(transaction_id) AS Transaction_Count
FROM B_LEARNING.S_LIGHT.RETAIL_SALES_DATASET
GROUP BY product_category;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q16. Find the total revenue (Total Amount) per gender. 
--Expected output: Gender, Total_Revenue 
SELECT gender,
       SUM(quantity*price_per_unit) AS Total_Revenue
FROM B_LEARNING.S_LIGHT.RETAIL_SALES_DATASET
GROUP BY gender;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q17. Find the average Price per Unit per product category. 
--Expected output: Product Category, Average_Price
SELECT product_category,
       avg(price_per_unit) AS Average_Price
FROM B_LEARNING.S_LIGHT.RETAIL_SALES_DATASET
GROUP BY product_category;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q18. Find the total revenue per product category where total revenue is greater than 10,000. 
--Expected output: Product Category, Total_Revenue
SELECT product_category,
       SUM(quantity*price_per_unit) AS Total_Revenue
FROM B_LEARNING.S_LIGHT.RETAIL_SALES_DATASET
GROUP BY product_category
HAVING Total_Revenue>10000;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q19. Find the average quantity per product category where the average is more than 2. 
--Expected output: Product Category, Average_Quantity 
SELECT product_category,
       AVG(quantity) AS Average_Quantity
FROM B_LEARNING.S_LIGHT.RETAIL_SALES_DATASET
GROUP BY product_category
HAVING Average_Quantity>2;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q20. Display a column called Spending_Level that shows 'High' if Total Amount > 1000, otherwise 'Low'. 
--Expected output: Transaction ID, Total Amount, Spending_Level 
SELECT
    Transaction_ID,
    Total_Amount,
    CASE
        WHEN Total_Amount > 1000 THEN 'High'
        ELSE 'Low'
    END AS Spending_Level
    FROM B_LEARNING.S_LIGHT.RETAIL_SALES_DATASET;
----------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q21. Display a new column called Age_Group that labels customers as: 
--• 'Youth' if Age < 30 
--• 'Adult' if Age is between 30 and 59 
--• 'Senior' if Age >= 60 
--Expected output: Customer ID, Age, Age_Group 
SELECT customer_id,
       age,
CASE
    WHEN age<30 THEN 'youth'
    WHEN age BETWEEN 20 AND 59 THEN 'adult'
    WHEN age>=60 THEN 'senior'
END AS Age_Group
FROM B_LEARNING.S_LIGHT.RETAIL_SALES_DATASET;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
