# DataMart_cleaning_Exploring_Analysis
This project focuses on analyzing the sales and performance of Data Dart, specifically evaluating the impact of large-scale supply changes made in June 2020.
This Project Involve Data Cleaning and exploring( analysing data ).
BackGround:
Data Dart is my latest venture and CEO want our  help to analyze the sales and performance of venture. 
In June 2020 - large scale supply changes were made at Data Mart. 
All Data Mart products now use sustainable packaging methods in every single step from the farm all the way to the customer.
CEO Need our  help to quantify the impact of this change on the sales performance for Data Mart and its separate business areas.
![image](https://github.com/manishwai/DataMart_cleaning_Exploring_Analysis/assets/110285234/2b40234d-d8cb-4099-ac95-7db2dc1b9878)

A)Data Cleansing Steps
In a single query, perform the following operations and generate a new table in the data_mart schema named clean_weekly_sales:
A.1)Add a week_number as the second column for each week_date value, for example any value from the 1st of January to 7th of January will be 1, 8th to 14th will be 2, etc.
A.2)Add a month_number with the calendar month for each week_date value as the 3rd column
A.3)Add a calendar_year column as the 4th column containing either 2018, 2019 or 2020 values
A.4)Add a new column called age_band after the original segment column using the following mapping on the number inside the segment value
   segment
![image](https://github.com/manishwai/DataMart_cleaning_Exploring_Analysis/assets/110285234/416f8ad6-b96e-4771-a4b0-f66cd6ea8d35)

A.5)Add a new demographic column using the following mapping for the first letter in the segment values:
![image](https://github.com/manishwai/DataMart_cleaning_Exploring_Analysis/assets/110285234/8672fab2-3180-4cb5-a4d2-47e51a196223)

A.6)Ensure all null string values with an "unknown" string value in the original segment column as well as the new age_band and demographic columns
Generate a new avg_transaction column as the sales value divided by transactions rounded to 2 decimal places for each record


B) Data Exploration
B.1)Which week numbers are missing from the dataset?
B.2)How many total transactions were there for each year in the dataset?
B.3)What are the total sales for each region for each month?
B.4)What is the total count of transactions for each platform
B.5)What is the percentage of sales for Retail vs Shopify for each month?
B.6)What is the percentage of sales by demographic for each year in the dataset?
B.7)Which age_band and demographic values contribute the most to Retail sales?

