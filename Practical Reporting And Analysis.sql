CREATE DATABASE Testing;
USE Testing;

--  select all the data which is on the 'testing table'

SELECT 
    *
FROM
    testing.data;
-- this return the value of many different names can be found in testing table 

SELECT 
    COUNT(DISTINCT  ReceiverName)
FROM
    data;

-- select all the data which receivername is BAR. YUSUF ADAMU using customer name to query a database
SELECT 
    *
FROM
    testing.data
WHERE
    ReceiverName LIKE 'BAR. YUSUF ADAMU';

-- shipment which shipment_id and waybill  grand total is greater that 2000--

SELECT 
    ShipmentId, Waybill
FROM
    testing.data
WHERE
    GrandTotal > 2000;

-- this shows  ShipmentId  which average  total >2000 and sorting the order with the waybill order 
-- and shipment_id

SELECT 
    ShipmentId, AVG(Total)
FROM
    testing.data
GROUP BY Waybill
HAVING AVG(Total) > 2000
ORDER BY ShipmentId;

-- Shipment which vatvalue is greater 100 and this can show the highest customer who paid more
--  due to the increase on the vatpayment

SELECT 
    *
FROM
    testing.data
WHERE
    vatvalue_display
LIMIT 100;


-- this is the average annual cash on delivery of customers who created shipment 
-- between the 19th of June 2018 to 20th june 2019

SELECT 
    GrandTotal
FROM
    testing.data
WHERE
    DateModified > '2018-06-19'
        AND '2018-06-20';

-- using the customers items to query the database e.g item like belt and clothes

SELECT 
    Description
FROM
    testing.data
WHERE
    Description LIKE '%BELT%';

SELECT 
    Description
FROM
    testing.data
WHERE
    Description LIKE '%CLOTHES%';

SELECT * FROM testing.data;

--  This  is the average annual total of customers  who created shipment
-- between the 19th of June 2018 to 20th june 2019 and weigh between 0,5 ans 2kg

SELECT 
 GrandTotal,Total,  AVG(Total)
 from
    data
WHERE
  ApproximateItemsWeight between 0.5 and 2
  GROUP BY waybill
HAVING COUNT(Total)
ORDER BY customerid;

SELECT 
Total,GrandTotal, COUNT(DateCreated)
FROM
    data
WHERE
   DateCreated = '2018-06-18 05:28:02'
GROUP BY waybill
HAVING COUNT(DateCreated)
ORDER BY customerid;


-- using the MIN() and MAX() to query the database
-- what is the MIN AND MAX of the 'TOTAL' in the database which shows the amount spent for each shipment by the customer

-- Solution

SELECT 
    MIN(Total) AS lowest
FROM
testing.data;

SELECT 
    MIN(GrandTotal) AS lowest
FROM
    testing.data;

-- Using either customer first name or last name to query the customer information from the database

SELECT 
    *
FROM
    testing.data
WHERE
    ReceiverName = 'MRS IFEOMA'
        OR ReceiverName = 'MRS SHALOM'; 

-- Extract all records from the 'testing.data' table, aside from those customer
-- whose name  'mrs ifeoma' , 'kingsley using the NOT IN operator

SELECT 
    *
FROM  testing.data
   
WHERE
    ReceiverName NOT IN ('mrs ifeoma' , 'kingsley');

-- extract the number of servicecentreID whose grandtotal is  greater 2,500 
-- this can shows the servicecentre whose generate more revenue for the company'''

SELECT 
    *
FROM
    testing.data
WHERE
    DestinationServiceCentreId > 10
        AND GrandTotal > 2500;

-- get the time it took to processin a shipment of the following waybill number

use testing; -- using the testing database

SELECT * FROM testing.data;

SELECT 
    DateCreated,DateModified
FROM
  data;
use testing;

-- BETWEEN OPERATOR QUERY
-- using  the between and And Operator to query which shipment waybill was processed  between this date

SELECT 
waybill
FROM
      data
WHERE
    DateCreated BETWEEN  '2018-06-18 04:41:45' and  '2018-06-18 05:28:02';
   
   -- to know shipment which was delivered using the shipment scan status
   SELECT 
waybill
FROM
      data
WHERE
    Shipmentscanstatus > 10;
    
-- This didn't return any value  becuase the delivery status column in the DB is null'''


-- Retrieve a list of  customer who paid above 1000
--  rename the 2nd column as customer with highest payment using ALiase AS

SELECT * FROM testing.data;
SELECT 
    customerid,  COUNT(Total) AS Customer_with_Highest_Payment
FROM
    data
WHERE
    GrandTotal > 1000
GROUP BY GrandTotal
ORDER BY GrandTotal ASC;

-- finding the average total amount spent by each customer - Finding the range for Total

SELECT ROUND((MAX(Total)- MIN(Total))/4/ 2) AS highest_amount_generated
FROM data;


-- to select customer whose name start  or end with b using the like operator and 

Use testing;

select * from  testing.data where ReceiverName like '%b%';

select * from  testing.data where ReceiverName like '___y';

select * from testing.data where Description  regexp 'clothes';


select * from testing.data where ReceiverName  regexp 'b[ru]';