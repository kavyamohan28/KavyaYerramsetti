SELECT * FROM farmservice.`farmservice-1`;

#no of male harvesters=no.of skilled harvesters

#Case-1 : Skilled harvesters vs quantity harvested i.e.,skilled harvesters vs amount of work done
select `Harvesters group name`, sum(`Skilled harvesters in group`), sum(`Quantity(tons)`)
from farmservice.`farmservice-1`
group by `Harvesters group name`
order by `Harvesters group name`;

#case-2 : waiting time-1 :difference between harvester's day start and harvetser's start time to farm

with CTE as 
(
select time_to_sec(TIMEDIFF(`Harvester start time to farm`,`Harvester Day start`))/60 as waiting1
from farmservice.`farmservice-1`
)
-- select * from CTE;                   #comment down lines shortcut : ctrl+/
SELECT avg(waiting1) from CTE;

#from above, we have time taken between harvetser day start(communication about harvesting) and harvester start time to farm as waiting1 (where officer note down the time of his commmunication with harvester about harvesteing  and harvester reach time to farm alter
#also,we have average waiting1 value as well.

# Case-3 :Travelling time : distance between harvester's start time to farm and harvetser's reach time to farm


select avg(time_to_sec(TIMEDIFF(`Harvester reach time to farm`, `Harvester start time to farm`))/60) as traveltime
from farmservice.`farmservice-1`;

# Case-4 :working hours (difference between harvesting start time&end time and breaktime) 

select (time_to_sec(timediff(`End time`,`Harvesting start time`))/3600) -time_to_sec(`Break time`)/3600 as workinghours,`Harvesters group name`,sum(`skilled harvesters in group`) #to get output in hours divide timetosec by 3600 else 60
from farmservice.`farmservice-1`
group by `Harvesters group name`
order by workinghours desc;
#case-5
#For below query #NOTE : The error you're encountering is due to the SQL mode ONLY_FULL_GROUP_BY, which is enabled in your MySQL environment. This mode requires that any column in the SELECT clause that is not aggregated (like SUM, COUNT, etc.) must be included in the GROUP BY clause. 
#In your case, the expression TIME_TO_SEC(TIMEDIFF(End time, Harvesting start time))/3600 is not aggregated and is not included in the GROUP BY clause.
SELECT 
  (TIME_TO_SEC(TIMEDIFF(`End time`, `Harvesting start time`))/3600) - TIME_TO_SEC(`Break time`)/3600 as workinghours,
  `Harvesters group name`, SUM(`skilled harvesters in group`)/sum(`Members in group`)*100 as skilfulness
FROM farmservice.`farmservice-1`
GROUP BY `Harvesters group name`, `End time`, `Harvesting start time`, `Break time`,`Members in group`
ORDER BY workinghours DESC;

# Case-6 :top 5 groups with greatest skilfulness w.r.t working hours

SELECT `Harvesters group name`,sum(workinghours) as total_working_hours,avg(skilfulness) as average_skilfulness
FROM
(
SELECT 
  (TIME_TO_SEC(TIMEDIFF(`End time`, `Harvesting start time`))/3600) - TIME_TO_SEC(`Break time`)/3600 as workinghours,
  `Harvesters group name`, SUM(`skilled harvesters in group`)/sum(`Members in group`)*100 as skilfulness
FROM farmservice.`farmservice-1`
GROUP BY `Harvesters group name`, `End time`, `Harvesting start time`, `Break time`,`Members in group`
) as subquery
group by `Harvesters group name`
order by `total_working_hours`DESC, `average_skilfulness` DESC
LIMIT 5;
 
 #from above,we could able to map skilfulness with working hours and to find any gaps.
 
 select * from farmservice.`farmservice-1`;
 
 # I want quantity harvested vs area by harvester group name and distance between farms 
 
 #Case-8 :I want to see the quantity harvetsed by actual area
 
 select farmservice.`farmservice-1`.`Quantity(tons)`,`farmservice-1`.`landid`,`Harvesting communication to harvester`,`Harvesters group name`,(farmservice.`farmservice-1`.`Area(ha)`/farmservice.`agrovetkrishi_live_dbo_landdetails`.`Area`)*100 as percentagearea_harvested
 from farmservice.`farmservice-1`
 join farmservice.`agrovetkrishi_live_dbo_landdetails`
 on farmservice.`farmservice-1`.`Landid`=farmservice.`agrovetkrishi_live_dbo_landdetails`.`LandId`
 group by `Harvesters group name`,`Harvesting communication to harvester`,`Area(ha)`,`Area`,`Landid`,`Quantity(tons)`
 Order by `Quantity(tons)` desc;

#contraversary between area harvested and quantity. Percentage harvested is how can it cross 100 %? as analysed,area(ha) written is > actual area in land details table.

#Case-9 : harvesting done-morning or afternoon 

SELECT *, 
       CASE 
	    WHEN TIME_FORMAT(`Harvesting start time`, '%H:%i:%s') <'12:00:00' THEN 'Morning'
        ELSE 'Afternoon'
        END AS Harvesting_time_of_day
FROM farmservice.`farmservice-1`;

#Case-10 : To get repetitive landids
SELECT `Landid`, COUNT(Landid) AS Frequency
FROM farmservice.`farmservice-1`
GROUP BY `Landid`
HAVING COUNT(Landid) > 1;
#as we get no rows, that mean no landid is being repeated twice or more.

SELECT * from farmservice.`farmservice-1`;

#Case-11 :Create category for distnace between farms and compare productivity by skilfulness by harvesters group

SELECT 
      CASE
      WHEN `Distance between farms`<1 THEN '<1KM'
      WHEN `Distance between farms` BETWEEN 1 AND 2 THEN '1-2KM'
      WHEN `Distance between farms` BETWEEN 3 AND 5 THEN '3-5KM'
      WHEN `Distance between farms` BETWEEN 5 AND 10 THEN '5-10KM'
      ELSE 'Unknown'
      END AS `Distance category`,
      avg(`Area(ha)`),avg(`Quantity(tons)`),SUM(`skilled harvesters in group`)/sum(`Members in group`)*100 as skilfulness,`Harvesters group name`
FROM farmservice.`farmservice-1`
group by `Distance category`,`Harvesters group name`

#conclusion : if there is any productivity drop w.r.t distnace between farms by skilfulness.->





