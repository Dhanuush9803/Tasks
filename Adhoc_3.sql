---1)product id should be in this format, eg:FUR-BO-10001798 to 10001798
---2) per_quantity_price should be output of Sales / Quantity of each customer records
---3) sales_type should be 3 categories
---if sales are higher than 1000 then 'Super'
---if sales are higher than 400 but lesser than 1000 then 'Average'
---if sales are lesser than 400 then 'low'
---4)Loss will be 1 if profit is negative

CREATE TABLE Sales_order_info AS
SELECT
    RIGHT(Product_ID, LENGTH(Product_ID) - INSTR(Product_ID, '-') - 2) AS Product_ID,
    Category,
    Sub_Category,
    Product_Name,
    Sales,
    Quantity,
    Sales / Quantity AS per_quantity_price,
    CASE
        WHEN Sales > 1000 THEN 'Super'
        WHEN Sales > 400 THEN 'Average'
        ELSE 'Low'
    END AS sales_type,
    Discount,
    IF(Profit < 0, 1, 0) AS Loss
FROM sales_purchase_data_updated;

-----------------------------------------------------------------------------------------

---Count of Distinct Order IDs:

SELECT COUNT(DISTINCT Order_ID) FROM sales_purchase_data_updated;

-----------------------------------------------------------------------------------------

---Count of Unique Product Names:

SELECT COUNT(DISTINCT Product_Name) FROM Sales_order_info;

-----------------------------------------------------------------------------------------

---Count of Distinct Segments:

SELECT COUNT(DISTINCT Segment) FROM sales_purchase_data_updated;

-----------------------------------------------------------------------------------------

---Recent Order Date:

SELECT MAX(Order_Date) FROM sales_purchase_data_updated;

-----------------------------------------------------------------------------------------

---Old Order Date:

SELECT MIN(Order_Date) FROM sales_purchase_data_updated;

-----------------------------------------------------------------------------------------

---Customer Info for Max Order Date:

SELECT * FROM sales_purchase_data_updated
WHERE Order_Date = (SELECT MAX(Order_Date) FROM sales_purchase_data_updated);

-----------------------------------------------------------------------------------------

---Number of Unique Customers from Texas and New York:

SELECT
    COUNT(DISTINCT CASE WHEN State = 'Texas' THEN Customer_Name END) AS No_of_cust_texas,
    COUNT(DISTINCT CASE WHEN State = 'New York' THEN Customer_Name END) AS No_of_cust_New_york
FROM sales_purchase_data_updated;

------------------------------------------------------------------------------------------

---Lead and Lag with Profit Status:

UPDATE dataset_with_lead_lag
SET profit_status = CASE WHEN Profit_Change_Percentage > 0 THEN 'Profit' ELSE 'Loss' END;

-------------------------------------------------------------------------------------------