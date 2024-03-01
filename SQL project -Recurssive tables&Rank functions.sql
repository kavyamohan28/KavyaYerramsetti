SELECT * FROM sample_superstore.`sample_-_superstore_orders`;

WITH  CTE AS (
SELECT `Customer Name`,Region,sum(Sales) as total_sales,dense_rank() OVER (partition by Region order by sum(Sales) DESC) AS customerrank
FROM sample_superstore.`sample_-_superstore_orders`
GROUP BY `Customer Name`,Region
)

-- SELECT * FROM CTE;
SELECT `Customer Name`,Region,total_sales,customerrank,row_number() OVER (partition by REGION ORDER BY CUSTOMERRANK) as row_num
-- dense_rank() OVER (partition by Region order by total_sales DESC) AS customerrank
FROM CTE
-- WHERE customerrank<=10;





# First: Create a temporary table using recursive table expressions to group the orders table on region and customer name aggregating on the sales value. Name this table as CTE.
#Next: Use a dense rank function partitioned on the region to rank the customers in decreasing order of Sales value in CTE. Display the top 10 customers by filtering on this new column
#Lastly: For the table orders, give a row number to each entry using the row function;
