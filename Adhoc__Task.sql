-- Task 1,2,3,4: Get required columns from sales_purchase_data_updated
SELECT
  SUBSTRING(Order_Id, 4) AS Order_id,
  Customer_Name,
  Order_Id,
  Order_date,
  MONTH(Order_date) AS order_month,
  CONCAT(YEAR(Order_date), '-', MONTH(Order_date)) AS year_month,
  Country,
  State,
  City,
  Region,
  Ship_mode,
  CONCAT(Region, '_', Country, '_', City, '_', State) AS location_info
INTO Sales_order_info
FROM sales_purchase_data_updated;
-- Task 5: Create Sales_order_info table
CREATE TABLE Sales_order_info AS
SELECT
  SUBSTRING(Product_ID, 8) AS Product_ID,
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
  Profit,
  CASE
    WHEN Profit < 0 THEN 1
    ELSE 0
  END AS Loss
FROM sales_purchase_data_updated;

-- Task 6: Count of distinct order_ids in sales_purchase_data_updated
SELECT COUNT(DISTINCT Order_Id) AS distinct_order_ids
FROM sales_purchase_data_updated;

-- Task 7: Count of unique product names in Sales_order_info
SELECT COUNT(DISTINCT Product_Name) AS unique_product_names
FROM Sales_order_info;

-- Task 8: Count of distinct Segments in sales_purchase_data_updated
SELECT COUNT(DISTINCT Segment) AS distinct_segments
FROM sales_purchase_data_updated;

-- Task 9: Recent order date in sales_purchase_data_updated
SELECT MAX(Order_date) AS recent_order_date
FROM sales_purchase_data_updated;

-- Task 10: Old order date in sales_purchase_data_updated
SELECT MIN(Order_date) AS old_order_date
FROM sales_purchase_data_updated;

-- Task 11: Customer info for the maximum order date
SELECT *
FROM sales_purchase_data_updated
WHERE Order_date = (SELECT MAX(Order_date) FROM sales_purchase_data_updated);

-- Task 12: No. of Unique Customers from Texas and New York
SELECT
  COUNT(DISTINCT CASE WHEN State = 'Texas' THEN Customer_Id END) AS No_of_cust_texas,
  COUNT(DISTINCT CASE WHEN State = 'New York' THEN Customer_Id END) AS No_of_cust_New_york
FROM sales_purchase_data_updated;
