# Dataset Source

## 1. Dataset Information

**Dataset Name:** Pizza Sales Dataset  
**Source:** Maven Analytics  
**Dataset Link:** https://mavenanalytics.io/challenges/maven-pizza-challenge

This dataset is used to develop a Pizza Sales Data Warehouse and Analytics project using Google BigQuery and Power BI.

## 2. Dataset Description

The dataset contains pizza sales transaction data, including information about orders, pizza products, pizza categories, and customers.

The data is used to analyze sales performance, product performance, customer purchasing behavior, and customer complaints.

## 3. Data Usage

The original dataset is used as the source layer (Bronze) in the Medallion Architecture.

The data is subsequently processed through the following layers:

- **Bronze:** Stores the original source data.
- **Silver:** Contains cleaned and transformed data.
- **Gold:** Contains dimensional tables and a sales fact table for analytical purposes.

## 4. Data Processing

Data processing and transformation are performed using SQL in Google BigQuery.

The Gold Data Warehouse is then connected to Power BI Desktop to create an interactive sales analytics dashboard.

## 5. Disclaimer

This project is developed for educational and portfolio purposes. The original dataset belongs to its respective source, Maven Analytics.

Dataset source: https://mavenanalytics.io/challenges/maven-pizza-challenge