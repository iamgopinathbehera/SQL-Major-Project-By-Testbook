use market_star_schema;

-- Q.1  Write a query to find the full details of shipment so select Order ID, Ship ID,Shipping_Cost, Ship_date from the database.
select a.Order_ID,a.Ship_id,b.Shipping_Cost,a.Ship_Date
FROM  shipping_dimen AS a
INNER JOIN market_fact_full AS b ON a.Ship_id = b.Ship_id; 

-- Q.2  Provide the customer name, city, state and the order ID and order quantity they Ordered 

select CD.Customer_Name,CD.City,CD.State,MF.Ord_id,MF.Order_Quantity FROM cust_dimen AS CD INNER JOIN market_fact_full AS MF ON CD.cust_id = MF.cust_id;

-- Q3 Provide the product details like order Id, shipment ID whose shipment mode is Regular Air

SELECT Order_ID,Ship_id,Ship_Mode FROM shipping_dimen WHERE Ship_Mode = 'REGULAR AIR' GROUP BY Ship_id,Order_ID; 

-- Q.4 Provide all the details of customers which are from West Bengal.

SELECT Cust_id,Customer_Name,City,State FROM cust_dimen WHERE State = 'West Bengal';

-- Q.5 Provide the order details like ord_id, prod_id, ship_id, cust_id whose discount is More than 0.05 and order_quantity is more than 10.
 
 SELECT Ord_id,Prod_id,Ship_id,Cust_id,Discount,Order_Quantity FROM market_fact_full WHERE Discount>0.05 AND Order_Quantity>10 ;

-- Q.6   Create a table shipping_mode_dimen having columns with their respective data Types as the following:
-- (i) Ship_Mode VARCHAR(25)
-- (ii) Vehicle_Company VARCHAR(25)
-- (iii) Toll_Required BOOLEAN

CREATE TABLE SHIPPING_MODE_DIEMEN (
SHIP_MODE VARCHAR(25),
VEHICLE_COMPANY VARCHAR(25),
TOLL_REQUIRED BOOLEAN
 );
 
 -- Q.7 Make 'Ship_Mode' as the primary key in the above table.
 
DROP TABLE IF EXISTS SHIPPING_MODE_DIEMEN; -- Deleting Because it can show error if not delete it
CREATE TABLE SHIPPING_MODE_DIEMEN (
SHIP_MODE VARCHAR(25),
VEHICLE_COMPANY VARCHAR(25),
TOLL_REQUIRED BOOLEAN,
PRIMARY KEY(SHIP_MODE) -- Making it as Primary Key
 );
 
--  Q.8  Insert two rows in the table created above having the row-wise values:
-- (i) ‘DELIVERY TRUCK', 'Ashok Leyland', false
-- (ii) 'REGULAR AIR', 'Air India', false
 INSERT INTO SHIPPING_MODE_DIEMEN VALUES ('DELIVERY TRUCK','ASHOK LEYLAND',FALSE);
 INSERT INTO SHIPPING_MODE_DIEMEN VALUES ('REGULAR AIR','AIR INDIA',FALSE);

-- Q.9 Add another column named 'Vehicle_Number' and its data type to the created table.

ALTER TABLE SHIPPING_MODE_DIEMEN ADD    VEHICLE_NUMBER VARCHAR(20);

-- Q.10  Update its value to 'MH-05-R1234'

 UPDATE SHIPPING_MODE_DIEMEN 
 SET VEHICLE_NUMBER='MH-05-R1234'
WHERE SHIP_MODE = 'DELIVERY TRUCK';

-- Q.11 Print the names of all customers who are either corporate or belong to Mumbai.

SELECT Customer_Name,City,Customer_Segment FROM cust_dimen WHERE CITY = 'Mumbai' AND Customer_Segment = 'CORPORATE';

--  Q.12 Find the total number of sales made.


SELECT SUM(Sales) AS 'Total NO.OF Sales' FROM market_fact_full;

 --  Q.13 .List the customer names in alphabetical order.
SELECT Customer_Name FROM cust_dimen ORDER BY Customer_Name;




