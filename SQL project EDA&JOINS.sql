use sample_superstore;
#QUERIES FOR FILTERING & ORDERING
select * from sample_superstore.`sample_-_superstore_orders`;
#Tasks :

#Task-1
select `Order ID`,Category from sample_superstore.`sample_-_superstore_orders`
where Category='Furniture';

#Task-2
select `Order ID`,`order Date` from sample_superstore.`sample_-_superstore_orders`
where `Order Date`>'30-11-2015';

#Task-3 
select `Customer Name` from sample_superstore.`sample_-_superstore_orders`
where `Customer Name` LIKE 'C%';

#Joins -Tasks
#Task-1 Joining orders table and returns table

select sample_superstore.`sample_-_superstore_orders`.`Order ID`,sample_superstore.`sample_-_superstore_orders`.Category from sample_superstore.`sample_-_superstore_orders`
join sample_superstore.`samplesuperstore_returns`
on sample_superstore.`sample_-_superstore_orders`.`Order ID` = sample_superstore.`samplesuperstore_returns`.`Order ID`;
                                            #OR
select * from sample_superstore.`sample_-_superstore_orders` 
join sample_superstore.`samplesuperstore_returns` 
on sample_superstore.`sample_-_superstore_orders`.`Order ID` = sample_superstore.`samplesuperstore_returns`.`Order ID`;


#Task-2 

select sample_superstore.`sample_-_superstore_orders`.`Order ID`,sample_superstore.`sample_-_superstore_orders`.City,sample_superstore.`sample_-_superstore_orders`.Region from sample_superstore.`sample_-_superstore_orders`
 join sample_superstore.samplesuperstore_people
on sample_superstore.`sample_-_superstore_orders`.Region =sample_superstore.`samplesuperstore_people`.Region
where sample_superstore.`samplesuperstore_people`.Region='East';



#Task-3 

select count(sample_superstore.`sample_-_superstore_orders`.`Order ID`) as returned_orders
from sample_superstore.`sample_-_superstore_orders`
inner join sample_superstore.samplesuperstore_returns
on sample_superstore.`sample_-_superstore_orders`.`Order ID` = sample_superstore.`samplesuperstore_returns`.`Order ID`
where sample_superstore.`samplesuperstore_returns`.ï»¿Returned='Yes';
