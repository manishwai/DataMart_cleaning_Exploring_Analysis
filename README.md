# **DataMart Cleaning, Exploring, and Analysis** !

## **Project Overview**

This project focuses on analyzing the sales and performance of DataMart, specifically evaluating the impact of large-scale supply changes made in June 2020. DataMart has transitioned to using sustainable packaging methods for all its products. The CEO requires an analysis to quantify the impact of this change on sales performance across various business areas.

![image](https://github.com/manishwai/DataMart_cleaning_Exploring_Analysis/assets/110285234/2b40234d-d8cb-4099-ac95-7db2dc1b9878)

## **Data Cleansing Steps**

In a single query, perform the following operations and generate a new table in the `data_mart` schema named `clean_weekly_sales`:

### **A.1) Add Week Number**
- Add a `week_number` column as the second column for each `week_date` value. For example:
  - Any value from January 1st to January 7th will be 1
  - January 8th to January 14th will be 2, and so on.

### **A.2) Add Month Number**
- Add a `month_number` column as the third column for each `week_date` value, representing the calendar month.

### **A.3) Add Calendar Year**
- Add a `calendar_year` column as the fourth column containing values: 2018, 2019, or 2020.

### **A.4) Add Age Band**
- Add an `age_band` column after the original `segment` column based on the following mapping:

  ![image](https://github.com/manishwai/DataMart_cleaning_Exploring_Analysis/assets/110285234/416f8ad6-b96e-4771-a4b0-f66cd6ea8d35)

### **A.5) Add Demographic Column**
- Add a `demographic` column using the following mapping for the first letter in the `segment` values:

  ![image](https://github.com/manishwai/DataMart_cleaning_Exploring_Analysis/assets/110285234/8672fab2-3180-4cb5-a4d2-47e51a196223)

### **A.6) Handle Null Values**
- Replace all null string values with "unknown" in the original `segment` column, as well as in the `age_band` and `demographic` columns.

### **A.7) Calculate Average Transaction**
- Generate a new `avg_transaction` column as the sales value divided by transactions, rounded to 2 decimal places for each record.

## **Data Exploration**

### **B.1) Missing Week Numbers**
- Identify which week numbers are missing from the dataset.

### **B.2) Total Transactions by Year**
- Calculate the total number of transactions for each year in the dataset.

### **B.3) Total Sales by Region and Month**
- Determine the total sales for each region for each month.

### **B.4) Total Transactions by Platform**
- Find the total count of transactions for each platform.

### **B.5) Percentage of Sales for Retail vs Shopify**
- Compute the percentage of sales for Retail versus Shopify for each month.

### **B.6) Percentage of Sales by Demographic**
- Calculate the percentage of sales by demographic for each year in the dataset.

### **B.7) Retail Sales by Age Band and Demographic**
- Identify which `age_band` and `demographic` values contribute the most to Retail sales.

