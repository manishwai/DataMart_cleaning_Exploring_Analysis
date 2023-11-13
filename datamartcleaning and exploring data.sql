use cleaning_data_mart;
select * from weekly_sales;
## Data Cleansing
CREATE TABLE clean_weekly_sales AS
SELECT
  week_date,
  week(week_date) AS week_number,
  month(week_date) AS month_number,
  year(week_date) AS calendar_year,
  region,
  platform,
  CASE
    WHEN segment = 'null' THEN 'Unknown'
    ELSE segment
    END AS segment,
  CASE
    WHEN right(segment, 1) = '1' THEN 'Young Adults'
    WHEN right(segment, 1) = '2' THEN 'Middle Aged'
    WHEN right(segment, 1) IN ('3', '4') THEN 'Retirees'
    ELSE 'Unknown'
    END AS age_band,
  CASE
    WHEN left(segment, 1) = 'C' THEN 'Couples'
    WHEN left(segment, 1) = 'F' THEN 'Families'
    ELSE 'Unknown'
    END AS demographic,
  customer_type,
  transactions,
  sales,
  ROUND(
      sales / transactions,
      2
   ) AS avg_transaction
FROM weekly_sales;

## Data Exploration
select * from clean_weekly_sales;
## 1.Which week numbers are missing from the dataset?
Create  table Week_number_t ( 
weeknumber int);
Insert Into Week_number_t(weeknumber)
 WITH RECURSIVE t AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM t
    WHERE n <= 51
)
SELECT n as week_number FROM t;
select w.* , c.week_number
 from week_number_t  as w
Left Join clean_weekly_sales as c
on w.weeknumber=c.week_number
where c.week_number is null;



## 2.How many total transactions were there for each year in the dataset?
select calendar_year , sum(transactions)
 from clean_weekly_sales
 group by calendar_year;
 
## 3.What are the total sales for each region for each month?
select month_number , region, sum(sales)
from clean_weekly_sales
group by month_number , region;

## 4.What is the total count of transactions for each platform
select platform , sum(transactions) 
from clean_weekly_sales
group by platform;

## 5.What is the percentage of sales for Retail vs Shopify for each month?

with t1 as (
select platform ,month_number, calendar_year, sum(sales) as year_month_sales
from clean_weekly_sales
group by platform,month_number,calendar_year),
t2 as (
select distinct  month_number,calendar_year , sum(sales) over( partition by month_number , calendar_year ) as overall_sales
from clean_weekly_sales)

select t1.* , (t1.year_month_sales/t2.overall_sales )*100
from t1 
join t2
on t1.month_number=t2.month_number and t1.calendar_year=t2.calendar_year;

## 6.What is the percentage of sales by demographic for each year in the dataset?
  with t1 as (select distinct calendar_year , demographic,sum(sales) as sum_sales
  from clean_weekly_sales
  group by calendar_year , demographic) , 
  t2 as ( select distinct calendar_year , demographic , sum(sales) over( partition by calendar_year) as yearly_sales_demographic
  from clean_weekly_sales)
  
  select t1.* ,t2.yearly_sales_demographic , (t1.sum_sales/t2.yearly_sales_demographic)*100
  from t1
  join t2
  on t1.calendar_year=t2.calendar_year and t1.demographic=t2.demographic;
  
## 7.Which age_band and demographic values contribute the most to Retail sales?
 select  distinct month_number, calendar_year, age_band,demographic , sum(sales) as total_sales
 from clean_weekly_sales
 where platform ="retail"
 group by  month_number, calendar_year, age_band,demographic;
 
 select  distinct month_number, calendar_year, age_band,demographic , sum(sales) over( partition by month_number, calendar_year) as total_sales_cum
 from clean_weekly_sales
 where platform ="retail";
 
 

