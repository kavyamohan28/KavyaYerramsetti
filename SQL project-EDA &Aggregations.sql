use sample_superstore;

#1 Top 10 orders by sales
select `Order ID`,sum(sales) AS Total_sales
from sample_superstore.`sample_-_superstore_orders`
group by `Order ID` 
ORDER BY Total_sales DESC
LIMIT 10;

select * from sample_superstore.`sample_-_superstore_orders`;

#2 Orders that are making losses grouping by order id and summing profits

select `Order ID`,sum(profit) as Total_Profit
from sample_superstore.`sample_-_superstore_orders`
where profit<0
group by `Order ID`
order by Total_Profit ASC;

#Count of orders that make loss;
select count(`Order ID`),sum(Profit) as Total_Profit from sample_superstore.`sample_-_superstore_orders`
where Profit<0;

#3 Sales value region wise 

select sum(Sales) as Total_Sales,Region from sample_superstore.`sample_-_superstore_orders`
group by Region
order by Total_Sales desc;

#4 List a count of the number of orders under each regional manager by grouping on order id in orders 
#and then joining with people. Then group by the regional manager and aggregate the orders. 


select sample_superstore.`samplesuperstore_people`.ï»¿Person as Manager,count(`Order ID`) as Order_count
from sample_superstore.`sample_-_superstore_orders`
join sample_superstore.`samplesuperstore_people` 
on sample_superstore.`sample_-_superstore_orders`.Region=sample_superstore.`samplesuperstore_people`.Region
group by sample_superstore.`samplesuperstore_people`.ï»¿Person
order by Order_count desc;




 