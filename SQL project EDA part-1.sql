#1 Viewing columns from each table : 

select * from sample_superstore.`sample_-_superstore_orders`;
select * from sample_superstore.`samplesuperstore_people`;
select * from sample_superstore.`samplesuperstore_returns`;
#1 Vieiwng orders table

select * from sample_superstore.`sample_-_superstore_orders`;
select count(*) from sample_superstore.`sample_-_superstore_orders`;

#2 count of  rows by each coulmn 
#Orders table 

select count(*) from sample_superstore.`sample_-_superstore_orders`;
select count(*) from  sample_superstore.`samplesuperstore_people`;
select count(*) from sample_superstore.`samplesuperstore_returns`;

select count(distinct segment)
 from sample_superstore.`sample_-_superstore_orders`; 
 select count(distinct Country/Region)
 from  sample_superstore.`sample_-_superstore_orders`;
 select count(distinct City)
 from sample_superstore.`sample_-_superstore_orders`;
 select count(distinct State)
 from sample_superstore.`sample_-_superstore_orders`;
 select count(distinct Region)
 from sample_superstore.`sample_-_superstore_orders`;
 select count(distinct Category)
from sample_superstore.`sample_-_superstore_orders`;
select distinct `Sub_Category`
from sample_superstore.`sample_-_superstore_orders`;
 select count(distinct `Product_Name`)
 from sample_superstore.`sample_-_superstore_orders`;
 
 
 #Count of rows by column in People table 
 select count( *) from sample_superstore.`samplesuperstore_people`;
 
 #Count of rows by column in Returns table 
 select count(*) from sample_superstore.`samplesuperstore_returns`; 
 
 
 #3 Sum of sales by region,category
 select region,sum(sales),Category
 from sample_superstore.`sample_-_superstore_orders`
 group by region,Category;
 
 #4 Total sales 
 select (sales*quantity) as Total_sales,Region,Category from sample_superstore.`sample_-_superstore_orders`
 group by Region;
 
 
 #5 checking if orderid is primary key or not 
 select count(*), 'OrderID' from sample_superstore.`sample_-_superstore_orders`
 group by 'OrderID'
 having count(*)>1;
 
 select * 
 from sample_superstore.`sample_-_superstore_orders`
 where 'orderid' = 'CA-2018-152156';
 
 #6 Checking if shipdate is>orderdate
 select * from sample_superstore.`sample_-_superstore_orders`
 where 'shipdate'<'orderdate';
 
 #7 Checking distinct shipmodes 
 select distinct `Ship Mode`
 from sample_superstore.`sample_-_superstore_orders`;
 
 #8 
 SELECT datediff(DAY,'ORDERDATE'),('SHIPDATE') 
 from sample_superstore.`sample_-_superstore_orders`;
 
 select * from sample_superstore.`sample_-_superstore_orders`;
 select distinct Category
 from sample_superstore.`sample_-_superstore_orders`;
 
 select * from sample_superstore.`samplesuperstore_returns`;
 #count of orderids
select count(`Order ID`) from sample_superstore.`sample_-_superstore_orders`;
 select count(distinct `Order ID`) from sample_superstore.`sample_-_superstore_orders`;
 #Distinct customers
 select count(distinct `Customer ID`) from sample_superstore.`sample_-_superstore_orders`;
 
 #Distinct Segments
 select distinct Segment from sample_superstore.`sample_-_superstore_orders`;
 
 #Distinct country/Region
 select distinct `Country/Region` from sample_superstore.`sample_-_superstore_orders`;
 
 #Distinct cities
 select distinct City from sample_superstore.`sample_-_superstore_orders`;
 select count(distinct City) from sample_superstore.`sample_-_superstore_orders`;
 
 #Distinct State
 select distinct State from sample_superstore.`sample_-_superstore_orders`;
 select count(distinct State) from sample_superstore.`sample_-_superstore_orders`;
 
 #Region
 select distinct Region from sample_superstore.`sample_-_superstore_orders`;
 
 #Distinct products
 select count(distinct `Product ID`) from sample_superstore.`sample_-_superstore_orders`;
 
 #distinct category
 select distinct Category from sample_superstore.`sample_-_superstore_orders`;
 
 #distinct sub-category
 select count(distinct `Sub-Category`) from sample_superstore.`sample_-_superstore_orders`;
 
 
 #distinct product name
 select count(distinct `Product Name`) from sample_superstore.`sample_-_superstore_orders`;
 
 # Count of orders returned
 select * from sample_superstore.`samplesuperstore_returns`
 where sample_superstore.samplesuperstore_returns.ï»¿Returned = 'Yes';
 
 select count(*) from sample_superstore.samplesuperstore_returns
 where sample_superstore.samplesuperstore_returns.ï»¿Returned = 'Yes';
 
 #people table
 select * from sample_superstore.`samplesuperstore_people`;
 
 




