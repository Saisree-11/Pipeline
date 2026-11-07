# Retail Sales ETL Pipeline using Python, Pandas & SQL

## Project Overview

This project demonstrates an end-to-end Retail Sales ETL (Extract, Transform, Load) pipeline using Python, Pandas, and SQL.

The pipeline ingests customer, product, and order data from CSV files, performs data quality checks, applies business transformations, validates records, and generates curated datasets for reporting and analytics.

---

## Business Problem

A retail company receives sales data from multiple source systems and requires a robust ETL process to:

- Validate incoming data
- Remove duplicate records
- Identify invalid transactions
- Handle late arriving records
- Calculate sales metrics
- Generate reporting-ready datasets
- Create audit and reconciliation reports
- Support incremental data loading
- Track historical customer changes using SCD Type 2

---

## Source Files

### customers.csv

Contains customer master data.

| Column |
|----------|
| customer_id |
| customer_name |
| city |

### products.csv

Contains product information.

| Column |
|----------|
| product_id |
| product_name |
| price |

### orders.csv

Contains order transactions.

| Column |
|----------|
| order_id |
| customer_id |
| product_id |
| quantity |
| order_date |
| status |

---

## ETL Workflow

### Step 1: Read Source Files
Load customer, product, and order data using Pandas.

### Step 2: Schema Validation
Validate source structure before processing.

### Step 3: Remove Duplicates
Remove duplicate customer records and 
